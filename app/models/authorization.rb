# == Schema Information
#
# Table name: authorizations
#
#  id         :integer         not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  secret     :string(255)
#  token      :string(255)
#

# an authorization is something that belongs to a user. A user may have more than one authorization,
# for e.g. github and google. Some of the components of that authorization may need to be
# reset at login
class Authorization < ActiveRecord::Base
  belongs_to :user
  validates :provider, :uid, :presence => true
  
  def update_credentials!(auth_hash)

    if auth_hash.has_key? "credentials"
      updated = false
      if auth_hash["credentials"].has_key? "token"
        self.token = auth_hash["credentials"]["token"] 
        updated = true
      end

      if auth_hash["credentials"].has_key? "secret"
        self.secret = auth_hash["credentials"]["secret"] 
        updated = true
      end

      if updated
        unless self.save
          puts "Couldn't save credentials"
          self.errors.each{|attr,msg| puts "#{attr} - #{msg}" }
        end
      end
    end
  end
  
  # override the class method for find_or_create to take an OmniAuth auth_hash
  # Note that this will also create a corresponding User if one doesn't exist for this authorization
  def self.find_or_create(auth_hash, user=nil)
    puts "AUTH hash: "
    puts auth_hash.inspect

    # note to self: this is ActiveRecord's dynamic attribute based finder (implemented using 'method_missing')
    unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      # Note that info/email may be nil (e.g. Twitter)
      if user.nil?
        # github doesn't require a name. if name is empty, use nickname, then email. 
        name = auth_hash["info"]["name"] 
        if name.nil? or name.empty? 
          if auth_hash["info"].has_key? "nickname" and not auth_hash["info"]["nickname"].empty?
            name = auth_hash["info"]["nickname"]
          elsif auth_hash["info"].has_key?("email") and not auth_hash["info"]["email"].empty?
            name = auth_hash["info"]["email"] 
          else
            name = "unknown"
          end
        end
        user = User.create :name => name #, :role_id => Role.where(:name=>'admin').id 
      end
      # puts user.inspect

      # only add the email if it is not nil, b/c of the regex checker
      user.email = auth_hash["info"]["email"] if auth_hash["info"].has_key?("email") and not auth_hash["info"]["email"].empty?

      puts user.inspect

      #TODO: check this! if it isn't a successful save, then do something smart
      if user.save
        puts "User saved!"
        puts user.inspect
        
        # for github:
        #authorization_code = params[:code]
        #access_token = github.get_token authorization_code
        #access_token.token   # => returns token value
        ###

        user_secret = auth_hash["credentials"].has_key? "secret" ? auth_hash["credentials"]["secret"] : ""
        user_token =  auth_hash["credentials"].has_key? "token" ? auth_hash["credentials"]["token"] : ""
        auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"],:secret => user_secret,:token => user_token
        puts user.inspect
        puts auth.inspect
      else
        puts "Couldn't create user"
        user.errors.each{|attr,msg| puts "#{attr} - #{msg}" }
      end
    end
    auth.update_credentials!(auth_hash)
    auth
  end
end
