class ChangeCountDefaultInVisits < ActiveRecord::Migration[5.2]
  def change
    change_column_default :visits, :count, from: nil, to: 1
  end
end
