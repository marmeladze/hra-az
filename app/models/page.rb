class Page < ActiveRecord::Base
  after_save :update_slug

  validates :title, uniqueness: true
  validates :title, :body, presence: true

  mount_uploader :image, ImageUploader
  scope :living, -> { where(deleted: false) }

  def living?
    not deleted?
  end

  def remove!
    Page.where(id: id).update_all(deleted: true)
  end
  
  def update_slug
    self.update_column(:slug, self.title.gsub('ə', 'e').parameterize)
  end
end
