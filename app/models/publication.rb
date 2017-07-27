class Publication < ActiveRecord::Base
  paginates_per 15
  after_save :update_slug

  mount_uploader :attachment, ImageUploader

  def update_slug
    self.update_column(:slug, self.title.gsub('ə', 'e').parameterize)
  end  
end
