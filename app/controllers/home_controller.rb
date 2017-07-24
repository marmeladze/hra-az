class HomeController < ApplicationController
  def index
    programmes = Article.programmes
    @active_pr = programmes.first
    @rest_pr = programmes - [@active_pr]
    category = Category.find_by(slug: 'xeberler')
    @featured = Article.where.not(category_id: [category.id, 5]).limit(3)
    articles = category.articles.for_slider
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
