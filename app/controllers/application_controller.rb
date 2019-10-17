class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize
  protected
  def authorize
    user = User.find_by(id: session[:user_id])
    if user
      user.make_current
    else
      redirect_to login_url, notice: "Your session expired! Please login in"
    end
  end

  def current_user
    User.current
  end
end
