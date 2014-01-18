#OmniAuth.config.logger = Rails.logger

OmniAuth.config.full_host = "http://localhost:3000" #"http://shopplist.herokuapp.com"
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '578631763686-t5ucjlaj2d5um54rq33qgrs76i4kl98n.apps.googleusercontent.com', 
  'p-ARY93GFDoOIsSTlsn4sPPo', scope: 'userinfo.email, userinfo.profile', provider_ignores_state: true
end