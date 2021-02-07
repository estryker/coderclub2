module ApplicationHelper
  def bootstrap_class_for flash_type
    puts "flash type " + flash_type
    case flash_type.to_s
    when 'success'
      "alert-success"
    when 'error'
      "alert-danger"
    when 'alert'
      "alert-warning"
    when 'notice'
      "alert-info"
    else
      "alert-" + flash_type.to_s
    end
  end
  
  def repo_name
    'coderclub_ruby' 
  end
  
  def github_save(params,base_url)
    # there will be a popup dialog box to request a file name. 
    puts "github save: #{params.inspect}"
    githubFileName = params[:githubFileName]

    github = Github.new oauth_token: signed_in? ? current_user.authorizations.first.token : ENV['GITHUB_TEST_TOKEN'] # user.authorizations.first.token 
    username = signed_in? ? current_user.name : ENV['GITHUB_TEST_USER'] #  current_user.name
    # First we make sure the user has a coderclub repo
    
    begin  
      # if file exists, update it
      puts "attempting to save to #{githubFileName}" 
      file = github.repos.contents.get(repo: repo_name, user: username, path: githubFileName)
      puts file
      puts "Updating ..."
      github.repos.contents.update(username, repo_name, githubFileName , content: params[:code], sha: file.sha, message: "update from CoderClub website at #{Time.now}", path:  githubFileName)
      puts "Done updating"
    rescue Exception => e
      puts e.message
      puts e.backtrace
      # if not, then create it
      puts "File didn't exist. Creating #{githubFileName}"

      unless github.repos.list.any? {|r| r.name == repo_name }
        puts "Initializing coderclub repo: #{repo_name}"
        github.repos.create(name: repo_name,
          description: "Repository for CoderClub code",
          homepage: "http://coderclub-rails.herokuapp.com/",
          private: false,
          has_issues: true,
          has_wiki: true,
          has_downloads: true)
      end
      github.repos.contents.create(username, repo_name, githubFileName , content: params[:code], message: "update from CoderClub website at #{Time.now}", path:  githubFileName)
      puts "Done creating"
    end

    return "#{base_url}/github/#{githubFileName}"
  end

  def github_user
    signed_in? ? current_user.name : ENV['GITHUB_TEST_USER']
  end

  def github_token
    signed_in? ? current_user.authorizations.first.token : ENV['GITHUB_TEST_TOKEN']
  end
   
  def save_locally(params,base_url)
    puts params.inspect
    @code = params[:code]
    hash = Digest::MD5.digest(@code).unpack("H*").first
    already_saved = RubyCode.where(code_hash: hash)
    url = nil
    # double check to make sure we don't have a hash collision
    if already_saved and (match = already_saved.find { | c |  c.code == @code })
      puts "already saved!"
      url = "#{base_url}/#{match.url_id}"
    else
      url_id = rand(1 << 32).to_s(36)
      puts "url id: " + url_id
      RubyCode.create(code: @code, url_id: url_id, code_hash: hash)
      url = "#{base_url}/#{url_id}"
    end
    return url
  end

  def lesson_link_name file_name
    link_name = file_name
    if mobj = file_name.match(/lesson(\d+)_(.+)/)
      lesson_num = mobj[1].to_i
      lesson_name = mobj[2].gsub("_"," ")
      link_name = "Lesson #{lesson_num} - #{lesson_name}"
    end
  end
end
