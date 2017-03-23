class AddComponentToBike < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :component, :string
  end
end
