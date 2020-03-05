class AddFavouriteToTastes < ActiveRecord::Migration[5.2]
  def change
    add_column :tastes, :favourite, :boolean
  end
end
