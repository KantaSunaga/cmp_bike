class AddBrakeTypeToBikes < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :brake_type, :integer
  end
end
