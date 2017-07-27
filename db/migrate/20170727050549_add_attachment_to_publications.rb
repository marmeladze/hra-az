class AddAttachmentToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :attachment, :string
  end
end
