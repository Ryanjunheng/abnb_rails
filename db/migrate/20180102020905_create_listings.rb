class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
    	t.string :title
    	t.string :address
    	t.string :description
      t.string :property_type
      t.string :zipcode
      t.string :city
      t.string :state
      t.string :country
    	t.integer :number_of_bed
   		t.integer :number_of_guest
      t.integer :number_of_room
    	t.integer :price
    	t.references :user, index: true, foreign_key: true
      t.timestamps null:false
    end
  end
end
