class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to login_path
  end

  def new

  end

  def show
    @user = User.find(params[:id])
  end

  def login
  end
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
