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

  def self.creating_maker_and_all_size_bike_need_argument_is(maker_name, year, bike_series, bike_name, frame_type, component, rear_derailleur, front_derailleur,
       crank, brake, chain, sprocket, sti_lever, bb, wheel, color,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,
       maker_url, shop_url, picture, size_list, weight_list, price, gear, fork)

       maker_created_authenticity = Maker.find_by(maker_name: maker_name)

       if maker_created_authenticity
         maker_info = maker_created_authenticity
       else
         maker_info = Maker.create(maker_name:maker_name, year: year)
       end

       roupe_end_time = size_list.length
       roupe_time = 0

       while roupe_time < roupe_end_time do

         bike_info = Bike.create( bike_series: bike_series, bike_name: bike_name, frame_type:frame_type,
                  component: component, rear_derailleur: rear_derailleur, front_derailleur:front_derailleur,
                  crank: crank, brake: brake, chain: chain, sprocket:sprocket, sti_lever: sti_lever, bb: bb,
                  wheel: wheel, color: color,saddle: saddle, seat_pillar: seat_pillar, handle: handle, stem: stem,
                  tire: tire, pedal: pedal, valve: pedal, accessory: accessory, maker_url: maker_url, shop_url: shop_url,
                  picture: picture, size: size_list[roupe_time], weight: weight_list[roupe_time], price: price,
                  gear: gear, fork: fork)
         maker_info.bikes << bike_info
         roupe_time += 1
       end
  end
end
