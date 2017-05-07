class Roadbike < ApplicationRecord
  require 'csv'
  require 'kconv'
  belongs_to :maker
  has_many :sizes, dependent: :destroy
  has_many :colors, dependent: :destroy

  def self.create_bike_from_csv(csv_file)
    # extension = File.basename(csv_file)
    # if extension.include?(".csv")
    #   flash[:check_extension] = "拡張子csvのものを洗濯してください"
    #   redirect_to :back
    # end
    # csv_info = csv_file.read
    CSV.parse(Kconv.toutf8(csv_file)) do |row|
      if row[0].to_i == 1
        year_info = Year.find_by(year: row[1].to_i)
        year_info = Year.create(year:ow[1].to_i) if year_info.blank?

        maker_info = year_info.makers.find_by(maker_name: row[2])
        maker_info = year_info.makers.create(maker_name: row[2], maker_comment: row[35]) if maker_info == nil

        sex = false
        sex = true if row[36].to_i == 2
        bike_info = Roadbike.create( bike_series: row[3],
                        bike_name: row[4],
                        frame_type:row[5].to_i,
                        rear_derailleur: row[6],
                        front_derailleur:row[7],
                        crank: row[8],
                        brake: row[9],
                        chain: row[10],
                        price: row[25].to_i,
                        sprocket: row[11],
                        sti_lever: row[12],
                        bb: row[13],
                        wheel: row[14],
                        saddle: row[15],
                        seat_pillar: row[16],
                        handle: row[17],
                        stem: row[18],
                        tire: row[19],
                        pedal: row[20],
                        valve: row[21],
                        accessory: row[22],
                        maker_url: row[23],
                        shop_url: row[24],
                        gear: row[26].to_i,
                        fork: row[27],
                        frame_name: row[28],
                        fork_type: row[29],
                        kc_or_cb: row[30],
                        component: row[31].to_i,
                        sex: sex,
                        road_bike_type:row[32].to_i,
                        brake_type: row[33].to_i,
                        bike_comment: row[35]
                        )
        maker_info.roadbikes << bike_info
      elsif row[0].to_i == 2
        bike_info = Roadbike.last
        color_info = Color.create(
                                  color: row[1],
                                  sub_color: row[2],
                                  sub_color2: row[3],
                                  official_color: row[4],
                                  picture: row[5]
                                  )
        bike_info.colors << color_info
      elsif row[0].to_i == 3
        bike_info = Roadbike.last
        size_info = Size.create(
                                size: row[1].to_i,
                                min_height: row[2].to_i,
                                max_height: row[3].to_i,
                                weight: row[4].to_i
                                )
        bike_info.sizes << size_info
      end
    end
  end

  def self.creating_maker_and_all_size_bike_need_argument_is(maker_name, year, bike_series, bike_name, frame_type, rear_derailleur, front_derailleur,
       crank, brake, chain, sprocket, sti_lever, bb, wheel,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,maker_url, shop_url,
       size_list, weight_list, price, gear, fork, frame_name, fork_type, kc_or_cb, component, height_list, sex, road_bike_type, brake_type,color_list,
       picture_list,official_color,bike_comment,maker_comment)

       year_info = Year.find_by(year: year.to_i)
       year_info = Year.create(year: year.to_i) if year_info.blank?

       maker_info = year_info.makers.find_by(maker_name: maker_name)
       maker_info = year_info.makers.create(maker_name: maker_name, maker_comment: maker_comment) if maker_info == nil

        bike_info = Roadbike.create( bike_series: bike_series,
                                bike_name: bike_name,
                                frame_type:frame_type,
                                rear_derailleur: rear_derailleur,
                                front_derailleur:front_derailleur,
                                crank: crank,
                                brake: brake,
                                chain: chain,
                                price: price,
                                sprocket: sprocket,
                                sti_lever: sti_lever,
                                bb: bb,
                                wheel: wheel,
                                saddle: saddle,
                                seat_pillar: seat_pillar,
                                handle: handle,
                                stem: stem,
                                tire: tire,
                                pedal: pedal,
                                valve: pedal,
                                accessory: accessory,
                                maker_url: maker_url,
                                shop_url: shop_url,
                                gear: gear,
                                fork: fork,
                                frame_name: frame_name,
                                fork_type: fork_type,
                                kc_or_cb: kc_or_cb,
                                component: component,
                                sex:sex,
                                road_bike_type:road_bike_type,
                                brake_type: brake_type,
                                bike_comment: bike_comment
                                )
        maker_info.roadbikes << bike_info

        size_roupe_end_time = size_list.length
        size_roupe_time = 0
        while size_roupe_time < size_roupe_end_time do
          bike_info.sizes.create(size: size_list[size_roupe_time], min_height: height_list[size_roupe_time][0],
                            max_height: height_list[size_roupe_time][1], weight: weight_list[size_roupe_time])
          size_roupe_time += 1
        end
        color_roupe_end_time = color_list.length
        color_roupe_time = 0
        while color_roupe_time < color_roupe_end_time do
          if color_list[color_roupe_time][1] != nil && color_list[color_roupe_time][1] != ""
            bike_info.colors.create(color: color_list[color_roupe_time][0],picture: picture_list[color_roupe_time],
                                    sub_color: color_list[color_roupe_time][1], official_color: official_color[color_roupe_time],
                                    sub_color2:color_list[color_roupe_time][2] )
          else
            bike_info.colors.create(color: color_list[color_roupe_time][0],picture: picture_list[color_roupe_time])
          end
          color_roupe_time += 1
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
   checked_bike_id_params
  end

  def self.get_bike_info_from(params_array)
    result_get_bike_info_from = []

    params_array.each do |bike_id|
      result_each = Roadbike.find_by(id: bike_id)
      result_get_bike_info_from << result_each
    end
    return result_get_bike_info_from
  end

  def self.serch_mach_bike(price_up, price_down, sex, road_bike_type, maker_id, frame_type,component_param,brake_type,color)
    sex_info = false if sex == "men"
    if color != "0"
     bike = Roadbike.joins(:colors).where(colors: {color: color}).or(Roadbike.joins(:colors).where(colors: {sub_color2: color})).or(Roadbike.joins(:colors).where(colors: {sub_color: color})).distinct
     bike = bike.where(price: price_down.to_i..price_up.to_i)
   else
      bike = Roadbike.where(price: price_down.to_i..price_up.to_i)
    end
    if bike != nil
        bike = bike.where(sex: sex_info) if sex_info == false
        bike = bike.where(component: component_param.to_i) if component_param != nil && component_param != ""
        bike = bike.where(road_bike_type: road_bike_type.to_i) if road_bike_type != nil && road_bike_type != ""
        bike = bike.where(maker_id: maker_id.to_i) if maker_id != nil && maker_id != ""
        bike = bike.where(frame_type: frame_type.to_i) if frame_type != nil && frame_type != ""
        bike = bike.where(brake_type: brake_type.to_i) if brake_type != nil && brake_type != ""
    end
    bike
  end

  def self.serch_bike_result_and_size(bike_arry, user_size)
    if bike_arry != nil
      result_bike_and_size = []

      bike_arry.each do |bike|
        bike_and_size = {bike_obj: bike}
        size_list = bike.sizes.where(min_height: 100..user_size.to_i, max_height: user_size.to_i..250)
        if size_list[0] != nil
          bike_and_size[:size] = size_list
        result_bike_and_size << bike_and_size#[{bike=>{bike_obj},size=>{size_obj}
        else
         return nil
        end
      end
      return result_bike_and_size
    end
  end

  def self.which_sex?(sex_param)
    return true if sex_param == "women"
    false
  end
end
