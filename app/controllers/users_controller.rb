class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @usrList = User.all
  end

  def new
    @usr = User.new
  end

  def create
    @usr = User.new(user_params)
    if @usr.save
      flash[:success] = "Welcome to the beta-firman-blog #{@usr.username}"
      redirect_to articles_path
    else
      flash[:danger] = "Failed to register"
      render 'new'
    end
  end

  def edit
    # @usr = User.find(params[:id]) # already defined
  end

  def update
    # @usr = User.find(params[:id]) # already defined
    if @usr.update(user_params)
      flash[:success] = "Your account was updated successfully "
      redirect_to articles_path
    else
      flash[:danger] = "Failed to update"
      render 'edit'
    end
  end

  def show
    # @usr = User.find(params[:id]) # already defined
    # @user_articles = @user.artilces.paginate() # still have an error
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @usr = User.find(params[:id])
    end


  def require_same_user
    if current_user != @usr
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end


end
