class ArticlesController < ApplicationController

  # define methods that can call private method set_article
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @art_list = Article.all
  end

  def new
    @art = Article.new # @art here for get component model
  end

  def edit
    # already defined on top before_action # @art = Article.find(params[:id])
  end

  def create
    @art = Article.new(article_params)
    if @art.save
      flash[:notice] = "Article was successfully created"
      logModel(@art)
      redirect_to article_path(@art)
    else
      render 'new'
    end
  end

  def update
    # already defined on top before_action # @art = Article.find(params[:id])
    if @art.update(article_params)
      flash[:notice] = "Article was successfully updated"
      logModel(@art)
      redirect_to article_path(@art)
    else
      render 'edit'
    end
  end

  def show
    # already defined on top before_action # @art = Article.find(params[:id])
  end

  def destroy
    # already defined on top before_action # @art = Article.find(params[:id])
    @art.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  # get Value from Form
  private
    def set_article
      @art = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end

  def logModel(art)
    puts
    puts "|========================================|"
    puts " id: #{art.id} "
    puts " title: #{art.title} "
    puts " description: #{art.description} "
    puts " created_at: #{art.created_at} "
    puts " updated_at: #{art.updated_at} "
    puts "|========================================|"
    puts
  end


end
