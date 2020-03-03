class CreateOpeningTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :opening_times do |t|
      t.time :opening_hour
      t.time :closing_hour
      t.integer :day
      t.boolean :open
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
