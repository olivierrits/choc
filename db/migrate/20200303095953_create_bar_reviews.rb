class CreateBarReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :bar_reviews do |t|
      t.references :bar_user, foreign_key: true
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
