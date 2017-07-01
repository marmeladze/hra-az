class AddDeletedToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :deleted, :boolean, default: false
  end
end
