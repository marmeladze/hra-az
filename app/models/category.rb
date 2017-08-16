class Category < ActiveRecord::Base
  paginates_per 15
  after_save :update_slug

  validates :name, presence: true
  validates :name, uniqueness: true
  
  has_many :articles

  scope :living, -> { where(deleted: false) }
  scope :for_navbar, -> { living.where(show_in_navbar: true).order(updated_at: :desc) }
  scope :blog, -> { living.where(slug: 'bloq').first }

  def living?
    not deleted?
  end

  def remove!
    Category.where(id: id).update_all(deleted: true)
  end

  def update_slug
    self.update_column(:slug, self.name.gsub('ə', 'e').parameterize)
  end

end
