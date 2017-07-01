class AddDeletedToAuthors < ActiveRecord::Migration
  def change
    add_column :authors,    :deleted, :boolean, default: false
    add_column :categories, :deleted, :boolean, default: false
    add_column :pages,      :deleted, :boolean, default: false
    add_column :articles,   :deleted, :boolean, default: false
  end
end
