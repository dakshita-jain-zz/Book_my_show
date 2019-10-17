class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :show_id
      t.references :show, foreign_key: true
      t.integer :user_id
      t.references :user, foreign_key: true
      t.integer :ticket_booked
      t.string :payment_method
      t.integer :total_amount
      t.datetime :booking_datetime
      t.timestamps null: false
    end
  end
end
