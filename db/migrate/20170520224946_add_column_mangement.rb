class AddColumnMangement < ActiveRecord::Migration[5.0]
  def change
     add_column :mangements, :temporary_flag, :boolean
  end
end
