OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '706897132672123', '216460ee28922542ac5a8940488401e3', scope: "friends_photos,publish_stream,status_update,user_friends", :display=>"popup", :image_size => "normal"

end
