class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :title
      t.string :property_type
      t.string :city
      t.string :state
      t.string :country
      t.integer :price

      t.timestamps
    end
  end
end
