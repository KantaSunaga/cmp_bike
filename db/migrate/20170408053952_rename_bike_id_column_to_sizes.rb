class RenameBikeIdColumnToSizes < ActiveRecord::Migration[5.0]
  def change
    rename_column :sizes, :bike_id, :roadbike_id
  end
end
