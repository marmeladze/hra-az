class PagesController < ApplicationController
  def show
    @page = Page.find_by(slug: params[:slug])
    if @page && @page.living?
      render 'show'
    else
      render file: 'public/404.html', status: :not_found
    end
  end
end
