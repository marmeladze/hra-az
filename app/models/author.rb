class Author < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :articles

  scope :living, -> { where(deleted: false) }
  
  def title
    name
  end

  def remove!
    Author.where(id: id).update_all(deleted: true)
  end
end
