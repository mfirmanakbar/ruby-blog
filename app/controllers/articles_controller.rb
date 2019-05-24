class ArticlesController < ApplicationController

  # define methods that can call private method set_article
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    # no pagination
    # @art_list = Article.all

    # with pagination
    @articles = Article.paginate(page: params[:page], per_page: 5).order(id: :desc)

    # sorry this is just example
    # @car_paginator = Car.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
    # @cars = @car_paginator.group_by { |r| r.created_at.to_date }

  end

  def new
    @art = Article.new # @art here for get component model
  end

  def edit
    # already defined on top before_action # @art = Article.find(params[:id])
  end

  def create
    # debugger
    @art = Article.new(article_params)

    # to find users limit 1. this is for us Hard code the user_id for articles table
    # @art.user = User.first
    @art.user = current_user

    if @art.save
      flash[:success] = "Article was successfully created"
      logModel(@art)
      redirect_to article_path(@art)
    else
      render 'new'
    end
  end

  def update
    # already defined on top before_action # @art = Article.find(params[:id])
    if @art.update(article_params)
      flash[:success] = "Article was successfully updated"
      logModel(@art)
      redirect_to article_path(@art)
    else
      render 'edit'
    end
  end

  def show
    # already defined on top before_action # @art = Article.find(params[:id])
    # @user_articles = Article.paginate(page: params[:page], per_page: 5).order(id: :desc)
  end

  def destroy
    # already defined on top before_action # @art = Article.find(params[:id])
    @art.destroy
    flash[:success] = "Article was successfully deleted"
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
