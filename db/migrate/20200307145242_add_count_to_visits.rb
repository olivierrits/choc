class AddCountToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :count, :integer
  end
end
