class ChangeCountDefaultInTastes < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tastes, :count, from: nil, to: 1
  end
end
