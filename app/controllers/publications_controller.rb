class PublicationsController < ApplicationController

  def index
    @publications = Publication.order(updated_at: :desc).page params[:page]
  end

  def show
    @publication = Publication.find_by(slug: params[:slug])
    @others = Publication.where.not(id: @publication.id)
    if @publication
      render 'show'
    else
      render 'home/404', status: :not_found
    end
  end
end
