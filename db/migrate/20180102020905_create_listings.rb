class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
    	t.string :title
    	t.string :address
    	t.integer :price
    	t.references :user, index: true, foreign_key: true
      t.timestamps null:false
    end
  end
end
