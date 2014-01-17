OmniAuth.config.logger = Rails.logger

OmniAuth.config.full_host = "http://localhost:3000"
Rails.application.config.middleware.use OmniAuth::Builder do
  #:strategy_class => OmniAuth::Strategies::Google
  provider :google_oauth2, '578631763686-1aorcmjr5ti62s0rtm01ath3ouhqa9qh.apps.googleusercontent.com', 'ffxhEyI8bAMIWxF84Bo-Vy3h', provider_ignores_state: true, scope: "userinfo.email"
  { :scope => 'https://www.googleapis.com/auth/email, https://www.googleapis.com/auth/userinfo.profile' }
end