#OmniAuth.config.logger = Rails.logger

OmniAuth.config.full_host = "http://shopplist.herokuapp.com"
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GMAIL_CLIENT_ID'], ENV['GMAIL_CLIENT_SECRET'], scope: 'userinfo.email, userinfo.profile', provider_ignores_state: true
end