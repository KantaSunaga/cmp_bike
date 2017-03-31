class ChangeDatatypeFrameTypeOfBikes < ActiveRecord::Migration[5.0]
  def change
    change_column :bikes, :frame_type, :integer
  end
end
