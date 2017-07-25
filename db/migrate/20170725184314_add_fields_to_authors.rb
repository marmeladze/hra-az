class AddFieldsToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :twitter, :string
    add_column :authors, :facebook, :string
    add_column :authors, :email, :string
  end
end
