
json.extract! bike, :id, :maker_id, :bike_series, :bike_name, :frame_type, :component, :rear_derailleur, :front_derailleur, :crank, :brake, :chain, :sprocket, :sti_lever, :bb, :bb, :wheel, :color, :saddle, :seat_pillar, :handle, :stem, :tire, :pedal, :valve, :accessory, :maker_url, :shop_url, :picture, :created_at, :updated_at

json.url bike_url(bike, format: :json)