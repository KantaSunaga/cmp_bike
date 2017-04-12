class AddYearIdToMakers < ActiveRecord::Migration[5.0]
  def change
    add_column :makers, :year_id, :integer
  end
end
