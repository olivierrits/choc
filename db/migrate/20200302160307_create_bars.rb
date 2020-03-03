class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :brand
      t.string :beans
      t.integer :percentage
      t.string :origin
      t.integer :price_range

      t.timestamps
    end
  end
end
