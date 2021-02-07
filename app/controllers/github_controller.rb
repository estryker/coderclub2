class GithubController < ApplicationController
  include ApplicationHelper

  # I don't think this is used now that I am using omniauth
  def authorize
    address = github_server.authorize_url redirect_uri: root_path, scope: 'repo'
    redirect_to address
  end

  # I don't think this is used now that I am using omniauth
  def callback
    authorization_code = params[:code]
    access_token = github_server.get_token authorization_code
    access_token.token   # => returns token value
  end

  def file_list
    github= Github.new oauth_token: github_token
    # we could use current_user.name in the view, but this allows for testing 
    @github_username = github_user
    @file_names = []
    if github.repos.list.any? {|r| r.name == repo_name }
      # files = github.repos.contents.get(current_user.name, 'coderclub_try_examples', "").find_all {|f| f.type == "file" }
      files = github.repos.contents.get(github_user, repo_name, "").find_all {|f| f.type == "file" }
      @file_names = files.map {|f| f.name }
    end

    # return file names 
    # hopefully the ajax call will make the format json
    respond_to do |format|
      # perhaps I should have a view that does this instead?? 
      format.json do
        render json: { file_name: @file_names}
      end
      format.html do
        render 'file_list'
      end
    end
  end

  private

  # I don't think this is used now that I am using omniauth
   def github_server
    @github ||= Github.new client_id: ENV['GITHUB_KEY'], client_secret: ENV['GITHUB_SECRET']
   end
end
