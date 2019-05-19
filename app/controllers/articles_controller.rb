class ArticlesController < ApplicationController

  def index
    @art_list = Article.all
  end

  def new
    @art = Article.new # @art here for get component model
  end

  def show
    @art = Article.find(params[:id])
  end

  def edit
    @art = Article.find(params[:id])
  end

  def destroy
    @art = Article.find(params[:id])
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  def create
    # render plain: params[:article].inspect # show result from form array format
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
    @art = Article.find(params[:id])
    if @art.update(article_params)
      flash[:notice] = "Article was successfully updated"
      logModel(@art)
      redirect_to article_path(@art)
    else
      render 'edit'
    end
  end

  # get Value from Form
  private
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
