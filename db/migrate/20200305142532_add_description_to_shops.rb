class AddDescriptionToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :description, :text
  end
end
