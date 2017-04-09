class Color < ApplicationRecord
    belongs_to :roadbike
    def self.create_color_and_picture(color_arry,picture_array, bike_obj)
      roupe_time_end = color_arry.length
      roupe_time = 0
      while roupe_time < roupe_time_end
        color_info = Color.create(color: color_arry[roupe_time], picture: picture_array[roupe_time])
        bike_obj.colors << color_info
        roupe_time += 1
      end
    end
    def self.serch_roadbike_color_agument_is(bike_obj, color_info)
       color = bike_obj.colors.where("color like '%" + color_info + "%'")
       color_hash = {bike_obj => color}
    end
end
