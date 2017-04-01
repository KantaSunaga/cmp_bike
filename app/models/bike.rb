class Bike < ApplicationRecord
  belongs_to :maker
  has_many :sizes, dependent: :destroy

  def self.creating_maker_and_all_size_bike_need_argument_is(maker_name, year, bike_series, bike_name, frame_type, rear_derailleur, front_derailleur,
       crank, brake, chain, sprocket, sti_lever, bb, wheel, color,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,
       maker_url, shop_url, picture, size_list, weight_list, price, gear, fork, frame_name, fork_type, kc_or_cb, component,height_list,sex,road_bike_type)
       maker_created_authenticity = Maker.find_by(maker_name: maker_name)

       if maker_created_authenticity
         maker_info = maker_created_authenticity
       else
         maker_info = Maker.create(maker_name: maker_name)
       end

        bike_info = Bike.create( bike_series: bike_series, bike_name: bike_name, frame_type:frame_type,
                  rear_derailleur: rear_derailleur, front_derailleur:front_derailleur,
                  crank: crank, brake: brake, chain: chain, sprocket:sprocket, sti_lever: sti_lever, bb: bb,
                  wheel: wheel, color: color,saddle: saddle, seat_pillar: seat_pillar, handle: handle, stem: stem,
                  tire: tire, pedal: pedal, valve: pedal, accessory: accessory, maker_url: maker_url, shop_url: shop_url,
                  picture: picture,  price: price, gear: gear, fork: fork, frame_name: frame_name, fork_type: fork_type,
                   kc_or_cb: kc_or_cb, component: component, sex:sex, road_bike_type:road_bike_type )
        maker_info.bikes << bike_info

        roupe_end_time = size_list.length
        roupe_time = 0
        while roupe_time < roupe_end_time do
          size = Size.create(size: size_list[roupe_time], min_height: height_list[roupe_time][0],
                            max_height: height_list[roupe_time][1], weight: weight_list[roupe_time])
                bike_info.sizes << size
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

  def self.find_bike_frame_param(frame_type)
      if frame_type == true
        Bike.where(frame_type: frame_type.to_i)
      end
  end

  def self.find_bike_price_param(price_up, price_down)
    Bike.where(price: price_down.to_i..price_up.to_i)
  end

    def self.find_bike_from_sex_param(sex)
      if sex == "men"
        self.where(sex: false)
      end
    end


  def self.find_bike_from_road_bike_type_param(road_bike_type)
      self.where(road_bike_type: road_bike_type.to_i)
  end

  def self.find_bike_from_user_size_param(user_size)
    if user_size != nil
      self.where(min_height: 100..user_size.to_i, max_height: user_size.to_i..300)
    end
  end

  def self.find_bike_from_color_param(color_param)
    if color_param != nil
      self.where("color like '%" + color_param + "%'")
    end
  end

  def self.find_bike_from_maker_param(maker_id)
    if maker_id != nil
      self.where(maker_id: maker_id.to_i)
    end
  end

  def self.serch_mach_bike(price_up, price_down,sex,color_param,road_bike_type,maker_id,frame_type)
    @bike = Bike.find_bike_price_param(price_up, price_down).find_bike_from_sex_param(sex).find_bike_from_color_param(color_param)

    if @bike !=nil
      if road_bike_type != nil
        @bike.find_bike_from_road_bike_type_param(road_bike_type)
      end
      if maker_id != nil
        @bike.find_bike_from_maker_param(maker_id)
      end
      if frame_type != nil
        @bike..find_bike_frame_param(frame_type)
      end
    end
    @bike
  end

  def self.serch_bike_result_and_size(bike_arry, user_size)
    if bike_arry != nil
      result_bike_and_size = []

      bike_arry.each do |bike|
        bike_and_size = {bike_obj: bike}
        size_list = bike.sizes.where(min_height: 100..user_size.to_i, max_height: user_size.to_i..250)

        if !(size_list.blank?) && size_list != nil
          bike_and_size[:size] = size_list
          result_bike_and_size << bike_and_size#[{bike=>bike_obj,size=>[size_obj]}...]
          
        else
          return nil
        end
      end
      return result_bike_and_size
    end
  end

end
