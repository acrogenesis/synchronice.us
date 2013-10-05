OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '706897132672123', '216460ee28922542ac5a8940488401e3', scope: "email,publish_stream"
end
