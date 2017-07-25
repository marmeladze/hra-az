class Author < ActiveRecord::Base
  paginates_per 15
  after_save :update_slug

  validates :name, presence: true
  validates :name, uniqueness: true

  mount_uploader :image, ImageUploader
  has_many :articles

  scope :living, -> { where(deleted: false) }
  
  def blog_posts
    articles.living.where(category_id: 6)
  end

  def living?
    not deleted?
  end
  
  def title
    name
  end

  def remove!
    Author.where(id: id).update_all(deleted: true)
  end

  def update_slug
    self.update_column(:slug, self.name.gsub('ə', 'e').parameterize)
  end  
end
