class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(slug: params[:slug])
    @articles = @category.articles.living
    
    if @category.living?
      render 'show'
    else
      render file: 'public/404.html', status: :not_found
    end
  end
end
