class DocumentsController < ApplicationController
  def index
    if params[:category]
      @documents = Document.categorized(params[:category]).page params[:page]
    else
      @documents = Document.living.group(:id, :category_slug).page params[:page]
    end
  end

  def show
    @document = Document.find_by(slug: params[:slug])
    if @document && @document.living?
      render 'show'
    else
      render 'home/404', status: :not_found
    end
  end
end
