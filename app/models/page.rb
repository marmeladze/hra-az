class Page < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
