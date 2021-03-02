Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, Rails.application.credentials.facebook[:app_id], Rails.application.credentials.facebook[:app_secret]
end