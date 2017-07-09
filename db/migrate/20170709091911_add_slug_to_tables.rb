class AddSlugToTables < ActiveRecord::Migration
  def change
    add_column :pages, :slug, :string, unique: true
    add_column :articles, :slug, :string, unique: true
    add_column :categories, :slug, :string, unique: true
    add_column :authors, :slug, :string, unique: true
  end
end
