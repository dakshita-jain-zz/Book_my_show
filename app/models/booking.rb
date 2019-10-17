class Booking < ActiveRecord::Base
  validate :decrement_ticket
  belongs_to :show
  belongs_to :user
  def decrement_ticket
    var=self.ticket_booked
    total=self.show.ticket_available
    final=total-var
    debugger
    @show = Show.find_by(id:self.show_id)
    @show.ticket_available = final
    @show.save
  end
end
