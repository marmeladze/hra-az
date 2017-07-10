class ApplicationController < ActionController::Base
  before_filter :fetch_pages_and_categories
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private 

  def fetch_pages_and_categories
    @pages = Page.for_navbar
    @categories = Category.for_navbar
  end
end
