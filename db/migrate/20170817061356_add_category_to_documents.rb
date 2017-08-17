class AddCategoryToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :category, :string
    add_column :documents, :attachment_az, :string
    add_column :documents, :attachment_en, :string
  end
end
