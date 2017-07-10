class Admin::PagesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "geometry123"
  before_action :set_page, only: [:edit, :update, :destroy, :remove]

  layout "admin"

  def index
    @pages = Page.living
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to admin_pages_path, notice: 'page was successfully created.'
    else
      render :new
    end
  end

  def update
    if @page.update(page_params)
      redirect_to admin_pages_path, notice: 'page was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to admin_pages_path, notice: 'page was successfully destroyed.'
  end

  def remove
    @page.remove!
    redirect_to admin_pages_path, notice: 'Page was successfully deleted.'
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :image, :show_in_navbar, :body, :deleted)
    end
end
