class CreateBikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.integer :maker_id
      t.string :bike_series
      t.string :bike_name
      t.string :frame_type
      t.string :component
      t.string :rear_derailleur
      t.string :front_derailleur
      t.string :crank
      t.string :brake
      t.string :chain
      t.string :sprocket
      t.string :sti_lever
      t.string :bb
      t.string :bb
      t.string :wheel
      t.string :color
      t.string :saddle
      t.string :seat_pillar
      t.string :handle
      t.string :stem
      t.string :tire
      t.string :pedal
      t.string :valve
      t.string :accessory
      t.string :maker_url
      t.string :shop_url
      t.binary :picture

      t.timestamps
    end
  end
end
