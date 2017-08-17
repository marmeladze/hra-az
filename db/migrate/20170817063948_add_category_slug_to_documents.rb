class AddCategorySlugToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :category_slug, :string
  end
end
