class CreateTastes < ActiveRecord::Migration[5.2]
  def change
    create_table :tastes do |t|
      t.references :bar_user, foreign_key: true
      t.boolean :favourite

      t.timestamps
    end
  end
end
