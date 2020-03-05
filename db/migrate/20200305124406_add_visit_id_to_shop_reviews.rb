class AddVisitIdToShopReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :shop_reviews, :visit, foreign_key: true
  end
end
