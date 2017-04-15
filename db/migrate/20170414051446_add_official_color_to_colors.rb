class AddOfficialColorToColors < ActiveRecord::Migration[5.0]
  def change
    add_column :colors, :official_color, :string
  end
end
