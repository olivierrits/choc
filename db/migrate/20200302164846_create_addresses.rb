class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.integer :postcode
      t.string :street
      t.integer :number
      t.decimal :longitude
      t.decimal :latitude
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
