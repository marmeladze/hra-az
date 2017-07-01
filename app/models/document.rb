class Document < ActiveRecord::Base
  scope :living, -> { where(deleted: false) }

  def remove!
    Document.where(id: id).update_all(deleted: true)
  end
end
