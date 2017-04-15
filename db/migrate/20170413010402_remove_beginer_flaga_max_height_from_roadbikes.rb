class RemoveBeginerFlagaMaxHeightFromRoadbikes < ActiveRecord::Migration[5.0]
  def change
    remove_column :roadbikes, :beginer_flag, :boolean
    remove_column :roadbikes, :max_hight, :integer
  end
end
