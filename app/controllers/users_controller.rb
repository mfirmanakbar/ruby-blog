class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @usrList = User.all
  end

  def new
    @usr = User.new
  end

  def create
    @usr = User.new(user_params)
    if @usr.save

      # will go to user page after signup
      # session[:user_id] = @usr.id
      # flash[:success] = "Welcome to the beta-firman-blog #{@usr.username}"
      # redirect_to user_path(@user)

      # need login first
      flash[:success] = "Hi #{@usr.username}, your account was registered successfully. Please Log In."
      redirect_to login_path

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

  def destroy
    @usr = User.find(params[:id])
    @usr.destroy
    flash[:danger] = "User and all articles created by user have been deleted"
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @usr = User.find(params[:id])
    end


  def require_same_user
    if current_user != @usr and  !current_user.admin
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin user can perform that action"
      redirect_to root_path
    end
  end


end
