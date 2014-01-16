#mniAuth.config.logger = Rails.logger

#OmniAuth.config.full_host = "http://localhost:3000"
Rails.application.config.middleware.use OmniAuth::Builder do
  #:strategy_class => OmniAuth::Strategies::Google
  provider :google_oauth2, '578631763686-sra9p3fkkci53q56sgrukff1624nlhu9', 'HNVpDTmtqUz478VtrO0hJD9M', provider_ignores_state: true, scope: "userinfo.email"
  #{ :scope => 'https://www.googleapis.com/auth/email, https://www.googleapis.com/auth/userinfo.profile' }
end