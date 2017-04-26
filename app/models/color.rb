class Color < ApplicationRecord
    belongs_to :roadbike
    scope :serch_color, -> { where("color = ? or sub_color = ? or sub_color2 = ? ",color)}
    def self.create_color_and_picture(color_arry,picture_array, bike_obj)
      roupe_time_end = color_arry.length
      roupe_time = 0

      while roupe_time < roupe_time_end
        color_info = Color.create(color: color_arry[roupe_time], picture: picture_array[roupe_time])
        bike_obj.colors << color_info
        roupe_time += 1
      end
    end
    def self.serch_roadbike_color_agument_is(bike_array, color_info)
      bike_result = []
      bike_array.each do |bike_obj|
        surch_result = bike_obj.colors.where("color like '%" + color_info + "%'")
        bike_result << bike_obj if surch_result != []
      end
      bike_result.flatten
    end
end
