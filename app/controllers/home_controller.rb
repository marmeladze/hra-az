class HomeController < ApplicationController
  def index
    programmes = Article.programmes
    @active_pr = programmes.first
    @rest_pr = programmes - [@active_pr]
    @cat = Category.find_by(slug: 'xeberler')
    @blog_posts = Category.blog.articles.order(updated_at: :desc).take(2)
    articles = @cat.articles.for_slider
    @active = articles.first
    @rest = articles - [@active]
    @interview = Publication.last
    exclude_ids = [@interview.id]+programmes.map(&:id)+articles.map(&:id)+@blog_posts.map(&:id)
    @featured = Article.where.not(id: exclude_ids).limit(9)
    @publications = Publication.where.not(id: @interview.id)
  end
  def contacts
    @contact = Contact.last
    address = @contact.address.split(",")
    @line1 = address.first
    @line2 = address.last
  end
end
