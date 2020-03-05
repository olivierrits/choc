class RemoveShopUserIdFromShopReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :shop_reviews, :shop_user
  end
end
