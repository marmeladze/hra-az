class AddPasswordDigestToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :password_digest, :string
    add_index :authors, :email, unique: true
  end
end
