class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.string :price
      t.text :summary
      t.text :contents

      t.timestamps null: false
    end
  end
end
