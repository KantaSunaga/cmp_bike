class AddSubColorToColors < ActiveRecord::Migration[5.0]
  def change
    add_column :colors, :sub_color, :string
  end
end
