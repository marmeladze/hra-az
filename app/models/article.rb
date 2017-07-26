class Article < ActiveRecord::Base
  paginates_per 15
  after_save :update_slug

  validates :title, uniqueness: true
  validates :title, :body, presence: true
  belongs_to :author
  belongs_to :category
  mount_uploader :image, ImageUploader

  scope :living, -> { where(deleted: false) }
  scope :for_slider, -> { living.order(id: :desc).take(5) }
  scope :programmes, -> { living.where(category_id: 5).take(5) }
  scope :interviews, -> { living.order(updated_at: :desc).where(category_id: 7).first }

  def living?
    not deleted?
  end

  def is_blog_post?
    category.slug == 'bloq'
  end

  def blog_image
    is_blog_post? ? author.image : image
  end

  def remove!
    Article.where(id: id).update_all(deleted: true)
  end

  def update_slug
    self.update_column(:slug, self.title.gsub('ə', 'e').parameterize)
  end
end
