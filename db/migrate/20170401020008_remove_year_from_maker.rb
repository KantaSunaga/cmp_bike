class RemoveYearFromMaker < ActiveRecord::Migration[5.0]
  def change
    remove_column :makers, :year, :integer
  end
end
