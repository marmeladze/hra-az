class PagesController < ApplicationController
  def show
    @page = Page.find_by(slug: params[:slug])
  end
end
