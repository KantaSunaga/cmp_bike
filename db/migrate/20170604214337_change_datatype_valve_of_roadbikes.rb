class ChangeDatatypeValveOfRoadbikes < ActiveRecord::Migration[5.0]
  def change
    change_column :roadbikes, :valve, :integer
  end
end
