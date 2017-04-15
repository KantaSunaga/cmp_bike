class AddMakerCommentToMakers < ActiveRecord::Migration[5.0]
  def change
    add_column :makers, :maker_comment, :text
  end
end
