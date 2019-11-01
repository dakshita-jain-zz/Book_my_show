class HomeController < ApplicationController
  skip_before_action:authorize, only:[:homepage]
  def index
    @shows = Show.all
    # @shows = Show.includes(:movie).all-------(n+1)th expression
    l=[]
    @shows.each do |show|
      l.append(show.movie.name)
    end
    #@shows.to_json(:include movie)
    respond_to do |format|
      format.html
      #format.json { render json: @shows.as_json(include: [movie: {:name}] ) }
      format.json { render :json => {:show => @shows.to_json,:moviename => l}}
    end
  end

  def homepage
    @movielist=Movie.all
  end
end
