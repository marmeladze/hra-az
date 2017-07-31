module Admin
  class DocumentsController < ApplicationController
    before_action :logged_in_user
    before_action :set_document, only: [:edit, :update, :destroy, :remove]

    layout "admin"

    def index
      @documents = Document.living.order(updated_at: :desc).page params[:page]
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

    def remove
      @document.remove!
      redirect_to admin_documents_path, notice: 'Document was successfully deleted.'
    end

    private
      def set_document
        @document = Document.find(params[:id])
      end

      def document_params
        params.require(:document).permit(:abbr, :title, :found, :description, :organization, :url_az, :url_en, :deleted)
      end
  end
end
