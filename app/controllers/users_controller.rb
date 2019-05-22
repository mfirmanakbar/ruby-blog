class UsersController < ApplicationController

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
    @usr = User.find(params[:id])
  end

  def update
    @usr = User.find(params[:id])
    if @usr.update(user_params)
      flash[:success] = "Your account was updated successfully "
      redirect_to articles_path
    else
      flash[:danger] = "Failed to update"
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
