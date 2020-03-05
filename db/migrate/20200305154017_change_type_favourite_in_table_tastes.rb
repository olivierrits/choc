class ChangeTypeFavouriteInTableTastes < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tastes, :favourite, false
  end
end
