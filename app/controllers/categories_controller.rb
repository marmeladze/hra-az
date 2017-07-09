class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(slug: params[:slug])
    @articles = @category.articles.living
  end
end
