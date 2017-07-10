class Question < ActiveRecord::Base
  after_save :update_slug

  validates :title, :answer, presence: true

  def anchorize
    "#"+slug
  end
  
  def update_slug
    self.update_column(:slug, self.title.gsub('ə', 'e').parameterize)
  end
end
