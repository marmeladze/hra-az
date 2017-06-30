class Admin::DocumentsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "geometry123"
  before_action :set_document, only: [:edit, :update, :destroy]

  layout "admin"

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def edit
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to admin_documents_path, notice: 'document was successfully created.'
    else
      render :new
    end
  end

  def update
    if @document.update(document_params)
      redirect_to admin_documents_path, notice: 'document was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @document.destroy
    redirect_to admin_documents_path, notice: 'document was successfully destroyed.'
  end

  private
    def set_document
      @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:abbr, :title, :found, :organization, :url_az, :url_en)
    end
end
