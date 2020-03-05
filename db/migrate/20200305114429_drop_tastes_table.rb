class DropTastesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :tastes
  end
end
