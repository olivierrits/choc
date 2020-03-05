class AddFavouriteToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :favourite, :boolean
  end
end
