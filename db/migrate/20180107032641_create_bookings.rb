class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
    	t.references :user, index: true, foreign_key: true
    	t.references :listing, index: true, foreign_key: true
    	t.date :start_date
    	t.date :end_date
    	t.integer :num_guest
      t.timestamps
    end
  end
end
