class Consultant < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
end
