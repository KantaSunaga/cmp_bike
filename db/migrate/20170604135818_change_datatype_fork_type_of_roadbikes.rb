class ChangeDatatypeForkTypeOfRoadbikes < ActiveRecord::Migration[5.0]
  def change
      change_column :roadbikes, :fork_type, :integer
  end
end
