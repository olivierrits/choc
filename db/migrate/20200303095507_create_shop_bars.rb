class CreateShopBars < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_bars do |t|
      t.references :shop, foreign_key: true
      t.references :bar, foreign_key: true

      t.timestamps
    end
  end
end
