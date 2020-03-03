class CreateShopReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_reviews do |t|
      t.references :shop_user, foreign_key: true
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
