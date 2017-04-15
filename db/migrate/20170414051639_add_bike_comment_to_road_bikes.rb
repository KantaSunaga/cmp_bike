class AddBikeCommentToRoadBikes < ActiveRecord::Migration[5.0]
  def change
    add_column :roadbikes, :bike_comment, :text
  end
end
