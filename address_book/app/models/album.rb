class Album < ActiveRecord::Base
  attr_accessible :avatar, :user_id,:profile_picture ,:avatar_cache
  belongs_to :users
  mount_uploader :avatar, AvatarUploader
end
