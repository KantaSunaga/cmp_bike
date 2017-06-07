class RenameKcOrCbColumnToRoadbikes < ActiveRecord::Migration[5.0]
  def change
    rename_column :roadbikes, :kc_or_cb, :tire_type
  end
end
