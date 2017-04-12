class RenameRoadebikeIdColumnToColors < ActiveRecord::Migration[5.0]
  def change
    rename_column :colors, :roadebike_id, :roadbike_id
  end
end
