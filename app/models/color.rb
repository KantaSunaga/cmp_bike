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
    def self.serch_roadbike_color_agument_is(bike_array, color_info)
      #  color_recorde = Color.where("color like '%" + color_info + "%'")
      # # bike = Roadbike.new
      #   bike = []
      #   color_recorde.each do |color|
      #     # bike = Roadbike.find_by(id: color.roadbike_id)#arrayで検索できない問題は、plukで解決できるか？
      #     bike << Roadbike.find_by(id: color.roadbike_id)#arrayで検索できない問題は、plukで解決できるか？
      #   end
      # bike
      bike_result = []
      bike_array.each do |bike_obj|
        surch_result = bike_obj.colors.where("color like '%" + color_info + "%'")
        bike_result << bike_obj if surch_result != []
      end
      bike_result.flatten
    end
end
