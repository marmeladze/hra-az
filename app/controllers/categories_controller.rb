class CategoriesController < ApplicationController
  
  def index
    @categories = Category.living
  end

  def show
    @category = Category.find_by(slug: params[:slug])
    @articles = @category.articles.living.page params[:page]
    
    if @category && @category.living?
      render 'show'
    else
      render 'home/404', status: :not_found
    end
  end
end
