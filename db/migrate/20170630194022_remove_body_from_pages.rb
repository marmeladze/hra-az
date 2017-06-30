class RemoveBodyFromPages < ActiveRecord::Migration
  def change
    remove_column :pages, :body, :string
    add_column    :pages, :body, :text
  end
end
