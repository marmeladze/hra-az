class Category < ActiveRecord::Base
  has_many :articles

  scope :living, -> { where(deleted: false) }

  def remove!
    Category.where(id: id).update_all(deleted: true)
  end
end
