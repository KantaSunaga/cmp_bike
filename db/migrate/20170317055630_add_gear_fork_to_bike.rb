class AddGearForkToBike < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :gear, :integer
    add_column :bikes, :fork, :string
  end
end
