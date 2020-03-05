class RenameShopUsersToVisits < ActiveRecord::Migration[5.2]
  def change
    rename_table :shop_users, :visits
    #use the pluralized name of tables here
  end
end
