class RenameBarUsersToTastes < ActiveRecord::Migration[5.2]
  def change
    rename_table :bar_users, :tastes
    #use the pluralized name of tables here
  end
end
