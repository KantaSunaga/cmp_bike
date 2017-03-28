class AddColumnToSize < ActiveRecord::Migration[5.0]
  def change
    add_column :sizes, :bike_id, :integer
  end
end
