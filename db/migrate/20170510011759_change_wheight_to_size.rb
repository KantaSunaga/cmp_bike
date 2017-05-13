class ChangeWheightToSize < ActiveRecord::Migration[5.0]
  def change
    change_column :sizes, :weight, :float
  end
end
