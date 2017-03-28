class AddBikeTypeToBikes < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :bike_type, :integer
  end
end
