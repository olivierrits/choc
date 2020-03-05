class RemoveBarUserIdFromBarReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bar_reviews, :bar_user
  end
end
