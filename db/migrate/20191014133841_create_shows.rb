class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.integer :movie_id
      t.references :movie, foreign_key: true
      t.string :venue
      t.datetime :showtime
      t.integer :ticket_available
      t.integer :price
      t.timestamps null: false
    end
  end
end
