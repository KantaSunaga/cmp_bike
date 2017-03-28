class AddSexMaxHeightMinHeightRoadBikeTypeToBikes < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :sex, :boolean ,default: false, null: false
    add_column :bikes, :max_hight, :integer
    add_column :bikes, :min_height, :integer
    add_column :bikes, :road_bike_type, :integer
  end
end
