module Admin
  class AuthorsController < ApplicationController
    before_action :logged_in_user
    before_action :set_author, only: [:edit, :update, :destroy, :remove]

    layout "admin"

    def index
      @authors = Author.living.page params[:page]
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

    def remove
      @author.remove!
      redirect_to admin_authors_path, notice: 'author was successfully deleted.'
    end

    private
      def set_author
        @author = Author.find(params[:id])
      end

      def author_params
        params.require(:author).permit(:name, :image, :deleted, :email, :twitter, :facebook, :bio_az, :bio_en)
      end
  end
end
