class UpdateAuthorSlugs < ActiveRecord::Migration
  def change
    Author.all.each do |article|
      article.update_columns(slug: article.title.parameterize)
    end
  end
end
