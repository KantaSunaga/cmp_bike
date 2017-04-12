class ChangeWeightToBike < ActiveRecord::Migration[5.0]
  def change
    change_column :bikes, :weight, :float
  end
end
