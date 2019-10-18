class TicketHistoryController < ApplicationController
  def index
    @ticket=current_user.bookings.all
  end
end
