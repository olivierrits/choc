class AddColumnsToBars < ActiveRecord::Migration[5.2]
  def change
    add_column :bars, :production, :string
    add_column :bars, :ingredients, :string
    add_column :bars, :description, :string
  end
end
