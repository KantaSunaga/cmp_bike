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
    @length = @bike.length if @bike != nil
  end

  def detail
   @bike = Roadbike.find_by(id: check_params_from_home[:id].to_i)
   @size = @bike.sizes
   @color = Color.where(roadbike_id: check_params_from_home[:id].to_i)
   official= []
   @color.each do |color|
     official << color.official_color
   end
   @official_color =official.join(",")
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
       :brake_type
       )
    end
end
