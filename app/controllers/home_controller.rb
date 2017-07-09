class HomeController < ApplicationController
  def index
    articles = Article.for_slider
    @active = articles.first
    @rest = articles - [@active]
  end
  def contacts
    @contact = Contact.last
    address = @contact.address.split(",")
    @line1 = address.first
    @line2 = address.last
  end
end
