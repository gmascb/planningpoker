OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '311017116012952', '7e681dd4fb6eef6f8c27c6fb823afc49'
end