class DocumentsController < ApplicationController
  def index
    @documents = Document.living
  end

  def show
    @document = Document.find_by(slug: params[:slug])
    if @document && @document.living?
      render 'show'
    else
      render file: 'public/404.html', status: :not_found
    end
  end
end
