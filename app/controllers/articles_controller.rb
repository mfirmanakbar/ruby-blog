class ArticlesController < ApplicationController

  def new
    @art = Article.new # @art here for get component model
  end

  def create
    # render plain: params[:article].inspect # show result from form array format
    @art = Article.new(article_params)
    @art.save
    logModel(@art)
    # redirect_to articles_show(@art)
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

  # get Value from Form
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
