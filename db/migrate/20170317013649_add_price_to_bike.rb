class AddPriceToBike < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :price, :integer
  end
end
