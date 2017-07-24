class Article < ActiveRecord::Base
  paginates_per 5
  after_save :update_slug

  validates :title, uniqueness: true
  validates :title, :body, presence: true
  belongs_to :author
  belongs_to :category
  mount_uploader :image, ImageUploader

  scope :living, -> { where(deleted: false) }
  scope :for_slider, -> { living.order(id: :desc).take(5) }
  scope :programmes, -> { living.where(category_id: 5).take(4) }


  def living?
    not deleted?
  end

  def remove!
    Article.where(id: id).update_all(deleted: true)
  end

  def update_slug
    self.update_column(:slug, self.title.gsub('ə', 'e').parameterize)
  end
end
