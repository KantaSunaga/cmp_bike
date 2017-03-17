class AddSizeToBike < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :size, :integer
  end
end
