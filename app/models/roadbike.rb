class Roadbike < ApplicationRecord
  require 'csv'
  require 'kconv'
  belongs_to :maker
  has_many :sizes, dependent: :destroy
  has_many :colors, dependent: :destroy

  def self.create_bike_from_csv(csv_file)
    begin
      file_type = File.extname(csv_file.original_filename)
    rescue
      return result = ["拡張子がcsvのファイルを選択してください"]
    end

    if file_type.blank? || file_type != ".csv"
      return result = ["拡張子がcsvのファイルを選択してください"]
    end
    success_bike = 0
    success_color = 0
    success_size = 0
    error_line = 0
    errow_row = 0
    CSV.foreach(csv_file.path, headers: false) do |row|
      error_line += 1
#                                                      csvの番号確認
      errow_row = Roadbike.check_csv_date([row[0],row[4],row[6],row[8],row[9],row[14],row[21],row[26],row[28],row[31],row[33],row[34]])
      if errow_row != nil

        return error_message = {line: error_line,row: errow_row}
      end
      row_num = 36
      loop{
          begin
            size_array = row[row_num].delete("'").split(",")
          rescue
            break
          end

          if size_array[0] == "size"
            return error_message = {line: error_line,row: row_num} if Roadbike.character?([size_array[1],size_array[2],size_array[3],size_array[4]])
          end
          row_num+=1
         }
    end
      CSV.foreach(csv_file.path, headers: false) do |row|
        year_info = Year.find_by(year: row[0].to_i)
        year_info = Year.create(year:row[0].to_i) if year_info.blank?

        maker_info = year_info.makers.find_by(maker_name: row[1])
        maker_info = year_info.makers.create(maker_name: row[1], maker_comment: row[35]) if maker_info == nil
        sex = false
        sex = true if row[35].to_i == 2

        pedal = false
        pedal = true if row[29] == 1
        bike_info = Roadbike.create( bike_series: row[2],
                        bike_name: row[3],
                        road_bike_type:row[4].to_i,
                        frame_name:row[5],
                        frame_type: row[6].to_i,
                        fork: row[7],
                        fork_type: row[8].to_i,
                        component: row[9].to_i,
                        rear_derailleur: row[10],
                        front_derailleur:row[11],
                        crank: row[12],
                        brake: row[13],
                        brake_type: row[14].to_i,
                        chain: row[15],
                        sprocket: row[16],
                        sti_lever: row[17],
                        bb: row[18],
                        tire: row[19],
                        wheel: row[20],
                        tire_type: row[21].to_i,
                        saddle: row[22],
                        seat_pillar: row[23],
                        handle: row[24],
                        stem: row[25],
                        valve: row[26].to_i,
                        accessory: row[27],
                        pedal: pedal,
                        maker_url: row[29],
                        shop_url: row[30],
                        gear: row[31].to_i,
                        sex: sex,
                        bike_comment: row[32],
                        price: row[33].to_i,
                        )
        maker_info.roadbikes << bike_info
        success_bike += 1

        roop_time = 36
        loop{
          begin
            array = row[roop_time].delete("'").split(",")
          rescue
            break
          end

          if array[0] == "color"
            color_info = Color.create(
                                     color: array[1],
                                     sub_color: array[2],
                                     sub_color2: array[3],
                                     official_color: array[4],
                                     picture: array[5]
                                     )
            bike_info.colors << color_info
            success_color += 1
          elsif array[0] == "size"
            size_info = Size.create(size: array[1].to_i,
                                    min_height: array[2].to_i,
                                    max_height: array[3].to_i,
                                    weight: array[4].to_f
                                    )
            bike_info.sizes << size_info
            success_size += 1
          else
            break
          end
          roop_time += 1
        }
    # 現状のcsvのmaxが37,カラーのスタートが３６から
    end
    return success_number = {bike: success_bike, color: success_color, size: success_size}

  end

  def self.character?(array)
    begin
      array.each{|val| Float(val)}
      false
    rescue
      true
    end
  end
# [row[4],row[6],row[8],row[9],row[14],row[21],row[26],row[28],row[31],row[33],row[34]]
  def self.check_csv_date(items)
    roop_time = 0
    cel_map = [0,4,6,8,9,14,21,26,28,31,33,34]
    items.each do |item|
      return cel_map[roop_time] if Roadbike.character?([item])
      roop_time += 1
      end
    nil
  end

  def self.creating_maker_and_all_size_bike_need_argument_is(maker_name, year, bike_series, bike_name, frame_type, rear_derailleur, front_derailleur,
       crank, brake, chain, sprocket, sti_lever, bb, wheel,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,maker_url, shop_url,
       size_list, weight_list, price, gear, fork, frame_name, fork_type, tire_type, component, height_list, sex, road_bike_type, brake_type,color_list,
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
                                tire_type: tire_type,
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

  def self.serch_mach_bike(price_up, price_down, sex, road_bike_type, maker_id, frame_type,component_param,brake_type,color,year)
    if color != "0"
      bike = Roadbike.joins(:colors).where(colors: {color: color}).or(Roadbike.joins(:colors).where(colors: {sub_color2: color})).or(Roadbike.joins(:colors).where(colors: {sub_color: color})).distinct
      bike = bike.where(price: price_down.to_i..price_up.to_i)
    else
       bike = Roadbike.where(price: price_down.to_i..price_up.to_i)
     end
     if bike != nil
         sex_info = false if sex == "men"
         bike = bike.where(sex: sex_info) if sex_info == false
         bike = bike.where(frame_type: frame_type) if frame_type.present?
         bike = bike.where(component: component_param.to_i) if component_param.present?
         bike = bike.where(road_bike_type: road_bike_type.to_i) if road_bike_type.present?
         bike = bike.where(maker_id: maker_id.to_i) if maker_id.present?
         bike = bike.where(frame_type: frame_type.to_i) if frame_type.present?
         bike = bike.where(brake_type: brake_type.to_i) if brake_type.present?
     end
     return bike if year == "old"
     bike = Roadbike.latest_model?(bike)
  end

  def self.serch_bike_result_and_size(bike_arry, user_size)
    if bike_arry != nil
      result_bike_and_size = []
      bike_arry.each do |bike|
        bike_and_size = {bike_obj: bike}

        size_list = bike.sizes.where(min_height: 100..user_size.to_i, max_height: user_size.to_i..250)
        if size_list[0].present?
          bike_and_size[:size] = size_list
        result_bike_and_size << bike_and_size#[{bike=>{bike_obj},size=>{size_obj}]
        end
      end
      return result_bike_and_size
    end
  end

  def self.which_sex?(sex_param)
    return true if sex_param == "women"
    false
  end


  def self.latest_model?(bike)
    retval = []
    bike.each do |b|
      if b.maker.year.id == Year.last.id
        retval << b
      end
    end
  end
end
