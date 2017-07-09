class ArticlesController < ApplicationController
  def show
    @article = Article.find_by(slug: params[:slug])
    if @article && @article.living?
      render 'show'
    else
      render file: 'public/404.html', status: :not_found
    end    
  end
end
