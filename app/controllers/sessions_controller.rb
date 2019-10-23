class SessionsController < ApplicationController
  skip_before_action :authorize
  def create
    user=User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
         flash[:notice]="Logged in Successfuly"
         user.make_current
         session[:user_id] = user.id
         redirect_to redirect_url(user)
      else
         redirect_to login_url,notice:"Invalid user credentials !Please Check the Username or Password"
      end
    else
      redirect_to new_signup_path,notice:"Not an existing user !! Please register and login "
    end
  end
  def new
  end

  def destroy
    User.reset_current
    session[:user_id]=nil
    redirect_to root_path
  end

  private

  def redirect_url(user)
    if user.email=='admin@gmail.com'
      url_for(:controller => :admin, :action => :index)
    else
      url_for(:controller => :home, :action => :index)
    end
  end
end
