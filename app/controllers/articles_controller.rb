class ArticlesController < ApplicationController
  def show
    @article = Article.find_by(slug: params[:slug])
    if @article && @article.living?
      render 'show'
    else
      render 'home/404', status: :not_found
    end    
  end
end
