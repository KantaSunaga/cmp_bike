class ChangeDatatypeTireTypeOfRoadbikes < ActiveRecord::Migration[5.0]
  def change
      change_column :roadbikes, :tire_type, :integer
  end
end
