class Page < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  scope :living, -> { where(deleted: false) }


  def remove!
    Page.where(id: id).update_all(deleted: true)
  end
end
