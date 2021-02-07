class TryController < ApplicationController
  # make sure users log in to github first
  before_action :authenticate, :only => [:github_code]

  include ApplicationHelper

  def home
    #default code to help the user
#@code = %Q{3.times do 
#  puts "Hello!"
#end
#"World"
#}
    @code = %Q{3.times do 
  puts "Hello "
end
}
    puts "code: #{@code}"
    puts "code_params"
    puts code_params.inspect
    if code_params.has_key? :code
      rc = RubyCode.where(url_id: code_params[:code])
      if rc
        @code = rc.first.code
      end
      puts "code: " + @code
    end
    render 'try/ruby'
  end

  def github_code
    @code = nil
    if code_params.has_key? :code
      github= Github.new oauth_token: github_token
      begin
        @file_name = code_params[:code]
        @code = Base64.decode64(github.repos.contents.get(repo: repo_name, user: github_user, path: @file_name).content)
      rescue Exception => e
        $stderr.puts "Couldn't get a github file:"
        $stderr.puts e.message
        $stderr.puts e.backtrace.join("\n")
      end
    end
    render 'try/ruby'    
  end

  def save
    url = root_url
    puts "code_params: #{code_params.inspect}"
    puts "commit: #{code_params[:commit]}"
    if code_params[:commit] == "Create URL"
      url =  save_locally(code_params,"/try/ruby")
      flash[:notice] = "Use this link to get to your code: #{root_url}#{url.sub(/^\//,'')}" # need to chop off that leading '/'
    elsif code_params[:commit] == "SaveToGithub" or code_params[:commit].nil? # we are submitting the form through a javascript call. no button name is given. 
      url =  github_save(code_params,"/try/ruby")
      flash[:notice] = "Code saved to Github"
        puts "url: #{url}"
    end
    redirect_to url 
  end

  private
  def code_params
    params.permit(:code,:commit,:githubFileName)
  end

  # allows arbitrary ruby code to be eval'd. cool, but not very secure. 
  def ruby_dont_use
    # @code = Opal.compile(params[:code])
    puts params.inspect
    @code = params[:code]
    
    # TODO: save a history of @code and add buttons to go back and forth

    sout = $stdout # save it off

    begin 
      catcher = StringIO.new
      $stdout = catcher
      res = eval(@code)
      catcher.close_write
      @code_output = catcher.string
      @code_inspect = res.inspect
    rescue Exception => e
      @code_error = e.message
    ensure
      # Yeah, let's make sure we restore $stdout
      $stdout = sout
    end
  end

  def authenticate
    deny_access unless signed_in? or (ENV.has_key? 'GITHUB_TEST_TOKEN' and not ENV['GITHUB_TEST_TOKEN'].empty?)
  end
end
