class AddColumnToBike < ActiveRecord::Migration[5.0]
  def change
    remove_column :bikes, :size, :integer
    remove_column :bikes, :max_high, :integer
    remove_column :bikes, :min_height, :integer
    remove_column :bikes, :weight, :float
  end
end
