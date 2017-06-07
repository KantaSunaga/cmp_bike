class ChangeDatatypePedalOfRoadbikes < ActiveRecord::Migration[5.0]
  def change
    change_column :roadbikes, :pedal, :boolean
  end
end
