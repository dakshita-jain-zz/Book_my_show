class SessionsController < ApplicationController
  skip_before_action :authorize
  def create
    user=User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
         flash[:notice]="Logged in Successfuly"
         session[:user_id] = user.id
         redirect_to url_for(:controller => :home, :action => :index)
      else
         redirect_to login_url,notice:"Invalid user Please Check the Username or Password"
      end
    else
      redirect_to new_signup_path,notice:"Not an existing user .please register and login "
    end
  end
  def new
  end

  def destroy
    session[:user_id]=nil
  end

end
