class AddTasteIdToBarReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :bar_reviews, :taste, foreign_key: true
  end
end
