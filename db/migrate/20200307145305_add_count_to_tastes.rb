class AddCountToTastes < ActiveRecord::Migration[5.2]
  def change
    add_column :tastes, :count, :integer
  end
end
