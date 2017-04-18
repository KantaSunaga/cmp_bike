class AddSubColor2ToColors < ActiveRecord::Migration[5.0]
  def change
    add_column :colors, :sub_color2, :string
  end
end
