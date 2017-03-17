class Bike < ApplicationRecord
  belongs_to :maker
  def self.creating_bike_need_argument_is(maker_name, year, bike_series, bike_name, frame_type, component, rear_derailleur, front_derailleur,
       crank, brake, chain, sprocket, sti_lever, bb, wheel, color,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,
       maker_url, shop_url, picture, size, weight, price)

       maker_info = Maker.create(maker_name:maker_name, year:year)

       bike_info =  Bike.create( bike_series: bike_series, bike_name: bike_name, frame_type:frame_type,
                component: component, rear_derailleur: rear_derailleur, front_derailleur:front_derailleur,
                crank: crank, brake: brake, chain: chain, sprocket:sprocket, sti_lever: sti_lever, bb: bb,
                wheel: wheel, color: color,saddle: saddle, seat_pillar: seat_pillar, handle: handle, stem: stem,
                tire: tire, pedal: pedal, valve: pedal, accessory: accessory, maker_url: maker_url, shop_url: shop_url,
                picture: picture, size: size, weight: weight, price: price)
       maker_info.bikes << bike_info
  end

  
end
