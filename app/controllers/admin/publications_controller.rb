module Admin
  class PublicationsController < ApplicationController
    before_action :logged_in_user
    before_action :set_publication, only: [:edit, :update]

    layout "admin"

    def index
      @publications = Publication.order(updated_at: :desc).page params[:page]
    end

    def new
      @publication = Publication.new
    end

    def edit
    end

    def create
      @publication = Publication.new(publication_params)

      if @publication.save
        redirect_to admin_publications_path, notice: 'Publication was successfully created.'
      else
        render :new
      end
    end

    def update
      if @publication.update(publication_params)
        redirect_to admin_publications_path, notice: 'Publication was successfully updated.'
      else
        render :edit
      end
    end

    private

    def set_publication
      @publication = Publication.find(params[:id])
    end


    def publication_params
      params.require(:publication).permit(:title_az, :title_en, :author, :isbn, :price, :summary_az, :summary_en, :contents_az, :contents_en, :attachment)
    end
  end
end