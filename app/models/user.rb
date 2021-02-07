# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  created_at         :datetime
#  updated_at         :datetime

class User < ActiveRecord::Base
  has_many :authorizations
  # attr_accessible :name

  validates :name, :presence => true, 
  :length => {:maximum => 50}
  
  def add_provider(auth_hash)
    # Check if the provider already exists, so we don't add it twice
    auth = nil
    if auth = authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      auth.update_credentials!(auth_hash)      
    else
      auth = Authorization.find_or_create(auth_hash, self)
      # Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
    auth
  end
end

