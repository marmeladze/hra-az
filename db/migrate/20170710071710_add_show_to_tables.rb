class AddShowToTables < ActiveRecord::Migration
  def change
    add_column :pages, :show_in_navbar, :boolean, default: true
    add_column :categories, :show_in_navbar, :boolean, default: true
  end
end
