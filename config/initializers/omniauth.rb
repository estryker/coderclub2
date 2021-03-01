Rails.application.config.middleware.use OmniAuth::Builder do
  # This will add the invisible route of /auth/github as well
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'] #, scope: "user,repo,gist"
end
