class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path
  end

  def new
  end

  def show
    @user = User.find(id: session[:user_id])
  end

  def login
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
