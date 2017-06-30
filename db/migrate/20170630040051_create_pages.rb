class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :image
      t.string :body

      t.timestamps null: false
    end
  end
end
