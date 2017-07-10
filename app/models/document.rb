class Document < ActiveRecord::Base
  paginates_per 15
  after_save :update_slug

  scope :living, -> { where(deleted: false) }

  def living?
    not deleted?
  end

  def anchorize
    "#"+slug
  end

  def remove!
    Document.where(id: id).update_all(deleted: true)
  end

  def update_slug
    self.update_column(:slug, self.title.gsub('ə', 'e').parameterize)
  end
end
