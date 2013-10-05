class User < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid, :pic, :calendar
  
  has_many :users_blocks, :class_name=>"UsersBlocks" 
  has_many :users_events, :class_name=>"UsersEvents"
  has_many :events, :through=>:users_events
  has_many :blocks, :through=>:users_blocks


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.pic = auth.info.image.split("?")[0] + "?type=normal"
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end


  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil # or consider a custom null object
  end

  def common_friends
    facebook { |fb| fb.fql_query("SELECT name,mutual_friend_count,pic,uid FROM user WHERE uid IN(SELECT uid2 FROM friend WHERE uid1=me()) AND is_app_user") }
  end
  
  def friends_count
    facebook { |fb| fb.get_connection("me", "friends").size }
  end
end
