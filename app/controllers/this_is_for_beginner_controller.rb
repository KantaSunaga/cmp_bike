class ThisIsForBeginnerController < ApplicationController
  require 'browser'
  def home
    @bike_info = Roadbike.new
    @maker = Maker.all
  end

  def result
    result = Roadbike.serch_mach_bike(check_params_from_home[:price_up], check_params_from_home[:price_down], check_params_from_home[:sex],
                              check_params_from_home[:detail_bike_type], check_params_from_home[:detail_maker],check_params_from_home[:detail_frame],
                              check_params_from_home[:detail_component],check_params_from_home[:brake_type],check_params_from_home[:color])
    @bike = Roadbike.serch_bike_result_and_size(result, check_params_from_home[:user_size].to_i)
    @color = check_params_from_home[:color]
    @length = @bike.length
  end

  def detail
   @bike = Roadbike.find_by(id: check_params_from_home[:id].to_i)
   @size = @bike.sizes.all
   @color = Color.where(roadbike_id: check_params_from_home[:id].to_i)
   @official_color = Color.pluck(:official_color).uniq.join(",")
  end

  private
    def check_params_from_home
      params.permit(
       :bike_type,
       :detail_frame,
       :detail_bike_type,
       :detail_component,
       :detail_maker,
       :price_down,
       :price_up,
       :color,
       :sex,
       :user_size,
       :id,
       :brake_type,
       :sub_color,
       :sub_color2)
    end
end
