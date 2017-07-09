class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :email
      t.string :twitter
      t.string :facebook
      t.string :address

      t.timestamps null: false
    end
  end
end
