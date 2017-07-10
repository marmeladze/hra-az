class PagesController < ApplicationController

  def index
    @pages = Page.living
  end

  def show
    @page = Page.find_by(slug: params[:slug])
    if @page && @page.living?
      render 'show'
    else
      render 'home/404', status: :not_found
    end
  end
end
