class HomeController < ApplicationController
  skip_before_action:authorize, only:[:homepage]
  def index
    @shows = Show.all
    @user = User.find_by(id: session[:user_id])
  end
  def homepage
    @movielist=Movie.all
  end
end
