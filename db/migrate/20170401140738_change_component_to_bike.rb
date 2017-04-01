class ChangeComponentToBike < ActiveRecord::Migration[5.0]
  def change
    change_column :bikes, :component, :integer
  end
end
