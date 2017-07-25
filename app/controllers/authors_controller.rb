class AuthorsController < ApplicationController
  
  def index
    @authors = Author.living
  end

  def show
    @author = Author.find_by(slug: params[:slug])
    @articles = @author.articles.living.page params[:page]
    
    if @author && @author.living?
      render 'show'
    else
      render 'home/404', status: :not_found
    end
  end
end
