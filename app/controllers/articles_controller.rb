class ArticlesController < ApplicationController
  layout "admin"
  before_action :set_article, only: [:show, :edit, :update, :destroy, :removed]
  before_action :logged_in_user
  before_action :permission

  def get_categroy
    @categroys = Categroy.all
    render json: @categroys.select("id,name")
  end

  # def good
  #   @article = Article.find(params[:id])
  #    respond_to do |format|
  #      if @article.update(good: 1)
  #        format.js
  #      end
  #    end
  # end
  #
  def forage
    @article = Article.find(params[:id])
    @article.update(good: 1)
    render json: @article
  end

  def cut
    @article = Article.find(params[:id])
    @article.update(good: 0)
    render json: @article
  end

  def canclegood
     @article = Article.find(params[:id])
     respond_to do |format|
       if @article.update(good: 0)
         format.js
       end
     end
  end

  def collection
    article = Article.find(params[:id])
    article.user_id = current_user.id
    if article.save
      render text: "已收藏"
    else
      render text: "收藏失败"
    end
  end

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.paginate(:page => params[:page], :per_page =>10)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      # if params[:article][:categroy_id] == "0"
      #   format.html { render :new, notice: '请选择类别!'} 
      if 
        @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to  articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def removed
  #   @article.destroy
  #   respond_to do |format|
  #       format.js
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :img, :categroy_id)
    end


end
