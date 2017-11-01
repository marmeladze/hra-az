module Admin
  class ArticlesController < ApplicationController
    before_action :logged_in_user

    before_action :set_article, only: [:edit, :update, :destroy, :remove]
    before_action :set_related, only: [:edit, :new]
    layout "admin"

    def index
      if params[:category]
        @articles = Article.search_for(params[:category]).page params[:page] 
      else
        @articles = Article.living.order(updated_at: :desc).page params[:page]
      end
    end

    def new
      @article = Article.new
    end

    def edit
    end

    def create
      @article = Article.new(article_params)

      if @article.save
        redirect_to admin_articles_path(category: @article.category_id), notice: 'Article was successfully created.'
      else
        render :new
      end
    end

    def update
      if @article.update(article_params)
        redirect_to admin_articles_path(category: @article.category_id), notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @article.destroy
      redirect_to admin_articles_path(category: @article.category_id), notice: 'Article was successfully destroyed.'
    end

    def remove
      @article.remove!
      redirect_to admin_articles_path(category: @article.category_id), notice: 'Article was successfully deleted.'
    end

    private
      def set_related
        @authors = Author.pluck(:name, :id)
        @categories = Category.where(deleted: false).pluck(:name_az, :id)
      end
      
      def set_article
        @article = Article.find(params[:id])
      end

      def article_params
        params.require(:article).permit(:title_en, :title_az, :image, :body_az, :body_en, :author_id, :category_id)
      end
  end
end
