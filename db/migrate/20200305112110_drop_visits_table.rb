class DropVisitsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :visits
  end
end
