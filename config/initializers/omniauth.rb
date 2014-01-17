OmniAuth.config.logger = Rails.logger

OmniAuth.config.full_host = "http://shopplist.herokuapp.com"
Rails.application.config.middleware.use OmniAuth::Builder do
  #:strategy_class => OmniAuth::Strategies::Google
  provider :google_oauth2, '578631763686-t5ucjlaj2d5um54rq33qgrs76i4kl98n.apps.googleusercontent.com', 'p-ARY93GFDoOIsSTlsn4sPPo', provider_ignores_state: true, scope: "userinfo.email"
 
end