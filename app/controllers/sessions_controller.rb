class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to users_path(user)
    else
      flash[:danger] = "Failed to log in"
      render 'new'
    end

    # render json: user
    # render json: { errors: ["wrong username or password"] }, status: :unauthorized
  end

  private
    def check_password
      @art = Article.find(params[:id])
    end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end


end
