class WelcomeController < ApplicationController
  layout "public"
  before_action :logged_in_user

  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 16)
    @categroys = Categroy.all
  end

  def freezer
    @collections = current_user.articles.paginate(:page => params[:page], :per_page => 16)
  end

  def classical
    @classicals = Article.paginate(:page => params[:page], :per_page => 16).where(good: 1)
  end

  def removed
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.destroy
        format.js
      end
    end
  end

  def good
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update(good: 1)
        format.js
      end
    end
  end

  def canclegood
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update(good: 0)
        format.js
      end
    end
  end

  def some_articles
    @articles = Categroy.find(params[:id]).articles.paginate(:page => params[:page], :per_page => 16)
  end

  def about

  end

end
