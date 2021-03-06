module Admin
  class CategoriesController < ApplicationController
    before_action :logged_in_user
    before_action :set_category, only: [:edit, :update, :destroy, :remove]

    layout "admin"

    def index
      @categories = Category.living.order(updated_at: :desc).page params[:page]
    end

    def new
      @category = Category.new
    end

    def edit
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to admin_categories_path, notice: 'category was successfully created.'
      else
        render :new
      end
    end

    def update
      if @category.update(category_params)
        redirect_to admin_categories_path, notice: 'category was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @category.destroy
      redirect_to admin_categories_path, notice: 'category was successfully destroyed.'
    end

    def remove
      @category.remove!
      redirect_to admin_categories_path, notice: 'Category was successfully deleted.'
    end

    private
      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name_az, :name_en, :show_in_navbar, :deleted)
      end
  end
end
