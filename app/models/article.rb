class Article < ActiveRecord::Base
  belongs_to :author
  belongs_to :category
  mount_uploader :image, ImageUploader

  scope :living, -> { where(deleted: false) }

  def remove!
    Article.where(id: id).update_all(deleted: true)
  end

end
