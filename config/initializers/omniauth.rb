OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '311017116012952', '7e681dd4fb6eef6f8c27c6fb823afc49'
  provider :google_oauth2, '163389718495-0dim4chd1tdc5f93inle20of7epcilj0.apps.googleusercontent.com', 'EsCprS3Xhnjg5nB5RAerOTSM', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end