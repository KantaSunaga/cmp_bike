class AddWeightToBike < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :weight, :integer
  end
end
