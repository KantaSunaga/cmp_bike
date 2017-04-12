class RemoveWeightToBikes < ActiveRecord::Migration[5.0]
  def change
    remove_column :bikes, :weight, :string
  end
end
