class AddIndexForSlugs < ActiveRecord::Migration
  def change
    add_index  :pages, :slug
    add_index  :authors, :slug
    add_index  :articles, :slug
    add_index  :categories, :slug
  end
end
