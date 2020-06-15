Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end