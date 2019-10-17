class BookingsController < ApplicationController
  def new
    @booking=Booking.new(show_id: params[:show_id],user: current_user)
  end
  def create

    @booking = current_user.bookings.new(booking_params)
    @booking.show_id = params[:show_id]
    if @booking.ticket_booked < @booking.show.ticket_available
      if @booking.save
        flash[:notice] ="Booking Successfull !!!"
        redirect_to show_booking_path(@booking.show_id, @booking.id)
      else
        flash[:notice] ="This is bad !!!"
        render :new
      end
    else
      flash[:notice]="The Number of Tickets You wanna book arent avaiable "
      redirect_to url_for(:controller => :home, :action => :index)
    end
  end

  def show
     @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:ticket_booked,:payment_method)
  end


end
