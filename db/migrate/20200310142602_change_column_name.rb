class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :tastes, :count, :counter
    rename_column :visits, :count, :counter
  end
end
