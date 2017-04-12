class RemoveWeightFromBike < ActiveRecord::Migration[5.0]
  def change
    remove_column :bikes, :Weight, :integer
  end
end
