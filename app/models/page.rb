class Page < ActiveRecord::Base
  paginates_per 15
  after_save :update_slug

  translates :title, :body

  validates :title_az, uniqueness: true
  validates :title_az, :body_az, presence: true

  mount_uploader :image, ImageUploader
  
  scope :living, -> { where(deleted: false) }
  scope :for_navbar, -> { living.where(show_in_navbar: true) }

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
