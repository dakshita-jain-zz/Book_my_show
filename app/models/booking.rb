class Booking < ActiveRecord::Base
  belongs_to :show
  belongs_to :user
  validate :decrement_ticket, on: :create
  validates :ticket_booked,  numericality: {greater_than_or_equal_to: 1}, presence: true
  validates :payment_method, presence: true

  def decrement_ticket
    var=self.ticket_booked
    total=self.show.ticket_available
    final=total-var
    @show = Show.find_by(id:self.show_id)
    @show.ticket_available = final
    @show.save
  end
end
