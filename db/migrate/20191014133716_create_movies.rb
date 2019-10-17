class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :actor
      t.string :director
      t.date :release_date
      t.integer :rating
      t.timestamps null: false
    end
  end
end
