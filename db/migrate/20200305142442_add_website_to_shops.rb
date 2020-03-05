class AddWebsiteToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :website, :string
  end
end
