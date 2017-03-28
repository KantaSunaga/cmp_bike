class Bike < ApplicationRecord
  belongs_to :maker
  has_many :size, dependent: :destroy
  def self.creating_bike_need_argument_is(maker_name, year, bike_series, bike_name, frame_type, rear_derailleur, front_derailleur,
       crank, brake, chain, sprocket, sti_lever, bb, wheel, color,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,
       maker_url, shop_url, picture, size, weight, price)

       maker_info = Maker.create(maker_name:maker_name, year:year)

       bike_info =  Bike.create( bike_series: bike_series, bike_name: bike_name, frame_type:frame_type,
                rear_derailleur: rear_derailleur, front_derailleur:front_derailleur,
                crank: crank, brake: brake, chain: chain, sprocket:sprocket, sti_lever: sti_lever, bb: bb,
                wheel: wheel, color: color,saddle: saddle, seat_pillar: seat_pillar, handle: handle, stem: stem,
                tire: tire, pedal: pedal, valve: pedal, accessory: accessory, maker_url: maker_url, shop_url: shop_url,
                picture: picture, size: size, weight: weight, price: price)
       maker_info.bikes << bike_info
  end

  def self.creating_maker_and_all_size_bike_need_argument_is(maker_name, year, bike_series, bike_name, frame_type, rear_derailleur, front_derailleur,
       crank, brake, chain, sprocket, sti_lever, bb, wheel, color,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,
       maker_url, shop_url, picture, size_list, weight_list, price, gear, fork, frame_name, fork_type, kc_or_cb, component,height_list,sex,road_bike_type)

       maker_created_authenticity = Maker.find_by(maker_name: maker_name)

       if maker_created_authenticity
         maker_info = maker_created_authenticity
       else
         maker_info = Maker.create(maker_name:maker_name, year: year)
       end

       roupe_end_time = size_list.length
       roupe_time = 0
       while roupe_time < roupe_end_time do
          name = "#{bike_name}(#{size_list[roupe_time]}cm)"
         bike_info = Bike.create( bike_series: bike_series, bike_name: name, frame_type:frame_type,
                  rear_derailleur: rear_derailleur, front_derailleur:front_derailleur,
                  crank: crank, brake: brake, chain: chain, sprocket:sprocket, sti_lever: sti_lever, bb: bb,
                  wheel: wheel, color: color,saddle: saddle, seat_pillar: seat_pillar, handle: handle, stem: stem,
                  tire: tire, pedal: pedal, valve: pedal, accessory: accessory, maker_url: maker_url, shop_url: shop_url,
                  picture: picture, size: size_list[roupe_time], weight: weight_list[roupe_time], price: price,
                  gear: gear, fork: fork, frame_name: frame_name, fork_type: fork_type, kc_or_cb: kc_or_cb, component: component ,
                  min_height: height_list[roupe_time][0], max_hight: height_list[roupe_time][1],sex:sex , road_bike_type:road_bike_type)
         maker_info.bikes << bike_info
         roupe_time += 1
       end
  end

  def self.check_params(bike_id,bike_id_1,bike_id_2,bike_id_3)
     cheking_params = [bike_id,bike_id_1,bike_id_2,bike_id_3]

     checked_bike_id_params = []

      cheking_params.each do |params|
       if params == 1
         next
       else
         checked_bike_id_params << params
       end
     end
    return checked_bike_id_params
  end

  def self.get_bike_info_from(params_array)

    result_get_bike_info_from = []

    params_array.each do |bike_id|
        result_each = Bike.find_by(id: bike_id)
        result_get_bike_info_from << result_each
    end
    return result_get_bike_info_from
  end

  # def self.serch_bike_from_user_params(bike_type, frame_type,road_bike_type, component,
  #                                 price_down,price_up,color,sex,user_size_up,user_size_down)
  #
  # if sex == "men"
  #   sex_info = false
  # elsif sex == "women"
  #   sex_info = true
  # else
  #   sex_info = nil
  # end
  # result_serch_bike = Bike.where(sex: sex_info,max_hight: user_size_down.to_i..user_size_up.to_i, min_height: user_size_down.to_i..user_size_up.to_i,
  #                                price: price_down.to_i..price_up.to_i, color: color, frame_type: frame_type, road_bike_type: road_bike_type
  #                                 ).where("component like '%#{component}%'")
  #  return result_serch_bike
  # end
    def self.find_bik_from_size_param(user_size_up,user_size_down)
     if user_size_up == true && user_size_down == true
       result = Bike.where(max_hight: user_size_down.to_i..user_size_up.to_i, min_height: user_size_down.to_i..user_size_up.to_i)
     elsif user_size_up == true && user_size_down == nil
       result = Bike.where(max_hight: 130..user_size_up.to_i)
     elsif user_size_up == false && user_size_down == true
       result = Bike.where(min_hight: user_size_down.to_i..200)
     else
     end
    end

    def self.find_bik_from_sex_param(sex)
      if sex == "men"
        result = Bike.where(sex: false)
      elsif sex == "women"
          result = Bike.where(sex: true)
      else
      end
    end
end
