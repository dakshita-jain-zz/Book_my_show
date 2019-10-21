class MoviesController < ApplicationController
  def new
    @movie=Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to admin_index_path, notice: 'Movie was successfully created.' }# get call to user which means user/index
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def bookings
    @movie = Movie.find(params[:id])
    @bookings = @movie.bookings
  end
  def update
    @movie = Movie.find(params[:id])
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to admin_index_path, notice: 'Movie was successfully updated.' }# get call to user which means user/index
      else
        format.html { render :edit }
      end
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :actor,:director, :release_date, :rating)
  end
end
