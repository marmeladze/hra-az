class Author < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :articles
end
