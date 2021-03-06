module ThisIsForBeginnerHelper
  def find_maker_name_from(bike_maker_id)
    maker_info = Maker.find_by(id: bike_maker_id)
    return maker_info
  end
  def chek_bike_type_from(bike_type)
    if bike_type == 1
      return "ロードバイク"
    elsif bike_type == 2
      return "マウンテンバイク"
    elsif bike_type == 3
      return "クロスバイク"
    elsif bike_type == 4
      return "ピストバイク"
    elsif bike_type == 5
      return "ミニベロ"
    elsif bike_type == 6
      return "シティサイクル"
    elsif bike_type == 7
      return "折りたたみ自転車"
    elsif bike_type == 8
      return "電動アシスト自転車"
    elsif bike_type == 9
      return "シクロクロス"
    elsif bike_type == 10
      return "TTバイク"
    end
  end
    def get_all_size(size_record)
      size_result = ""
      size_record.each do |size_info|
         size_result << " #{size_info.size}cm"
      end
      return size_result
    end
    def chek_frame_type_from(bike_frame)
      if bike_frame == 1
        return "カーボン"
      elsif bike_frame == 2
        return "アルミ"
      elsif bike_frame == 3
        return "クロモリ"
      end
    end

    def chek_compornent_from(compornent)
        if compornent == 1
          return "SRAM/S-Series"
        elsif compornent == 2
          return "SRAM/Apex"
        elsif compornent == 3
          return "SRAM/Apex 1"
        elsif compornent == 4
          return "SRAM/Rival"
        elsif compornent == 5
          return "SRAM/Rival 1"
        elsif compornent == 6
          return "SRAM/Force"
        elsif compornent == 7
          return "SRAM/Force 1"
        elsif compornent == 8
          return "SRAM/RED"
        elsif compornent == 9
          return "SRAM/RED eTAP"
        elsif compornent == 10
          return "SHIMANO/DURA-ACE"
        elsif compornent == 11
          return "SHIMANO/ULTEGRA"
        elsif compornent == 12
          return "SHIMANO/105"
        elsif compornent == 13
          return "SHIMANO/TIAGRA"
        elsif compornent == 14
          return "SHIMANO/SORA"
        elsif compornent == 15
          return "SHIMANO/CLARIS"
        elsif compornent == 16
          return "SHIMANO/DURA-ACE DI2"
        elsif compornent == 17
          return "SHIMANO/ULTEGRA DI2"
        elsif compornent == 18
          return "CAMPAGNOLO/SuperRecord EPS"
        elsif compornent == 19
          return "CAMPAGNOLO/SuperRecord"
        elsif compornent == 20
          return "CAMPAGNOLO/Record EPS"
        elsif compornent == 21
          return "CAMPAGNOLO/Record"
        elsif compornent == 22
          return "CAMPAGNOLO/Chorus EPS"
        elsif compornent == 23
          return "CAMPAGNOLO/Chorus"
        elsif compornent == 24
          return "CAMPAGNOLO/Athena"
        elsif compornent == 25
          return "CAMPAGNOLO/Potenza"
        elsif compornent == 26
          return "CAMPAGNOLO/Veloce"
        end
    end

    def chek_roade_bike_type_from(road_bike_type)
      if road_bike_type == 1
        return "ロングライド"
      elsif road_bike_type == 2
        return "エンデュランス"
      elsif road_bike_type == 3
        return "エアロバイク"
      end
    end

    def find_brake_type(brake_type)
        return "ディスクブレーキ" if brake_type == 2
        return "リムブレーキ"
    end

    def find_picture(color, bike_id)
      if color == "0"
        color_recorde = Color.find_by(roadbike_id: bike_id)
      else
        color_recorde = Color.find_by(color: color, roadbike_id: bike_id)
        color_recorde = Color.find_by(sub_color2: color, roadbike_id: bike_id) if color_recorde.blank?
        color_recorde = Color.find_by(sub_color: color, roadbike_id: bike_id) if color_recorde.blank?
      end
        return color_recorde.picture
    end

    def find_color(bike_id, color)
      if color == "0"
        color_list = []
        color_recorde = Color.where( roadbike_id: bike_id)
        color_recorde.each do |color_obj|
          color_list << color_obj.official_color
        end
        return color_list.join(",")
      else
        color_recorde = Color.find_by(roadbike_id: bike_id, color: color)
        color_recorde = Color.find_by(roadbike_id: bike_id, sub_color: color) if  color_recorde.blank?
        color_recorde = Color.find_by(roadbike_id: bike_id, sub_color2: color) if color_recorde.blank?
        return color_recorde.official_color
      end
    end
    def which_sex(sex)
      return "男性モデル" if sex == false
      return "女性モデル"
    end
end
