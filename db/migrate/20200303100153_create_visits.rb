class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.references :shop_user, foreign_key: true
      t.boolean :favourite

      t.timestamps
    end
  end
end
