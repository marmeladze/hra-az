class UpdateSlugsForTables < ActiveRecord::Migration
  def change
    Article.all.each do |article|
      article.update_columns(slug: article.title.parameterize)
    end
    
    Category.all.each do |article|
      article.update_columns(slug: article.name.parameterize)
    end
    
    Page.all.each do |article|
      article.update_columns(slug: article.name.parameterize)
    end

    Page.all.each do |article|
      article.update_columns(slug: article.title.parameterize)
    end
  end
end
