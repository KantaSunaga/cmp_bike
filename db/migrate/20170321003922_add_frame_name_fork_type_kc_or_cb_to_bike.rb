class AddFrameNameForkTypeKcOrCbToBike < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :frame_name, :string
    add_column :bikes, :fork_type, :string
    add_column :bikes, :tire_type, :string
  end
end
