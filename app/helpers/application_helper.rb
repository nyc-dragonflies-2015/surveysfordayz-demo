
module ApplicationHelper
  def logged_in?
    redirect_to login_path unless authenticated?
  end

  def authenticated?
    !!session[:user_id]
  end
end
