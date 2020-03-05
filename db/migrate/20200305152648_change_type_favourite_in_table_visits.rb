class ChangeTypeFavouriteInTableVisits < ActiveRecord::Migration[5.2]
  def change
    change_column_default :visits, :favourite, false
  end
end
