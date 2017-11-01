class ApplicationController < ActionController::Base
  before_filter :set_locale
  before_filter :fetch_pages_and_categories
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale 
  end

  include SessionsHelper

  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end


  private 

  def fetch_pages_and_categories
    @pages = Page.for_navbar
    @categories = Category.for_navbar
    @fpages = Page.living
    @fcategories = Category.living
    @programmes = Article.programmes
    @dcats = Document.pluck(:category, :category_slug).uniq
    @contact = Contact.first
    @latest = Article.living.order(updated_at: :desc).take(@fcategories.count - 2)
  end
end
