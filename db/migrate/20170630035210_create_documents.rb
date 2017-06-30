class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :abbr
      t.text :title
      t.string :found
      t.string :organization
      t.text :url_az
      t.text :url_en

      t.timestamps null: false
    end
  end
end
