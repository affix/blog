class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :create, :new, :destroy]
  before_action :verify_admin, only: [:edit, :update, :create, :new, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.order('id DESC').all
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

  # GET /tag/:title
  def tagged_articles
    @tag = params[:title]
    if Tag.find_by_title(params[:title])
      @articles = Tag.find_by_title(params[:title]).articles.order("created_at DESC")
    else
      redirect_to root_path
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.attributes = {'tag_ids' => []}.merge(params[:article] || {})
    @article.user = current_user
    respond_to do |format|
      if @article.save
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
    @article.attributes = {'tag_ids' => []}.merge(params[:article] || {})
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
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Simple way to verify user has post permissions!
    def verify_admin
      if !current_user.is_admin
        redirect_to root_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, :tags)
    end
end
