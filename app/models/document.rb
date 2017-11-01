class Document < ActiveRecord::Base
  paginates_per 15
  after_save :update_slugs

  translates :abbr, :title, :organization, :description

  mount_uploader :attachment_en, ImageUploader
  mount_uploader :attachment_az, ImageUploader

  scope :living, -> { where(deleted: false) }
  scope :categorized, ->(cs) { living.where(category_slug: cs) }

  CATEGORIES = [
    "Birləşmiş Millətlər Təşkilatı (BMT)  insan hüquqları müdafiə sistemi",
    "Avropa Şurası (AŞ)  insan hüquqları müdafiə sistemi",
    "Amerika Dövlətləri Təşkiları (ADT)  insan hüquqları müdafiə sistemi",
    "Afrika İttifaqı (Aİ) insan hüquqları müdafiə sistemi"
  ]
  def living?
    not deleted?
  end

  def anchorize
    "#"+slug
  end

  def remove!
    Document.where(id: id).update_all(deleted: true)
  end

  def update_slugs
    self.update_columns(slug: self.title.gsub('ə', 'e').parameterize, category_slug: self.category.gsub('ə', 'e').parameterize)
  end
end
