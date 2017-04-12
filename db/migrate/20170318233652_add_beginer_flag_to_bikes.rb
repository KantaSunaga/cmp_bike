class AddBeginerFlagToBikes < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :beginer_flag, :boolean ,default: false, null: false
  end
end
