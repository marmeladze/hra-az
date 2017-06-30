class Admin::AuthorsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "geometry123"
  before_action :set_author, only: [:edit, :update, :destroy]

  layout "admin"

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to admin_authors_path, notice: 'author was successfully created.'
    else
      render :new
    end
  end

  def update
    if @author.update(author_params)
      redirect_to admin_authors_path, notice: 'author was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    redirect_to admin_authors_path, notice: 'author was successfully destroyed.'
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name, :image)
    end
end
