class AddSlugToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :slug, :string, unique: true
  end
end
