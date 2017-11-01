class Question < ActiveRecord::Base
  paginates_per 15
  after_save :update_slug

  translates :title, :answer

  validates :title_az, :answer_az, presence: true

  def anchorize
    "#"+slug
  end
  
  def update_slug
    self.update_column(:slug, self.title.gsub('ə', 'e').parameterize)
  end
end
