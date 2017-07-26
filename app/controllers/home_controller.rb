class HomeController < ApplicationController
  def index
    programmes = Article.programmes
    @active_pr = programmes.first
    @rest_pr = programmes - [@active_pr]
    @cat = Category.find_by(slug: 'xeberler')
    @blog_posts = Category.blog.articles.order(updated_at: :desc).take(3)
    @featured = Article.where.not(category_id: [@cat.id, 5, 6]).limit(6)
    articles = @cat.articles.for_slider
    @active = articles.first
    @rest = articles - [@active]
    @interview = Article.interviews
  end
  def contacts
    @contact = Contact.last
    address = @contact.address.split(",")
    @line1 = address.first
    @line2 = address.last
  end
end
