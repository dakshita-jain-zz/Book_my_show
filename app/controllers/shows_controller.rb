class ShowsController < ApplicationController
  def new
    @show=Show.new(movie_id: params[:id])
  end

  def create
    @show= Show.new(shows_params)
    respond_to do |format|
      if @show.save
        format.html { redirect_to admin_index_path, notice: 'show was successfully created.' }# get call to user which means user/index
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])
    respond_to do |format|
      if @show.update(shows_params)
        format.html { redirect_to admin_index_path, notice: 'Show  was successfully updated.' }# get call to user which means user/index
      else
        format.html { render :edit }
      end
    end
  end
  def show
    @showlist = Show.where(movie_id: params[:id])
  end
  private
  def shows_params
    params.require(:show).permit(:venue,:showtime, :ticket_available,:price,:movie_id)
  end
end
