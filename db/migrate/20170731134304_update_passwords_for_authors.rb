class UpdatePasswordsForAuthors < ActiveRecord::Migration
  def change
    Author.all.each do |author|
      author.password = 'geometry123'
      author.save
    end
  end
end
