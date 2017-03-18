class AddWeightToBikes < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :weight, :float
  end
end
