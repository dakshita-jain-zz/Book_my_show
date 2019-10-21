class AdminController < ApplicationController
  def index
    @movielist=Movie.all
  end
end
