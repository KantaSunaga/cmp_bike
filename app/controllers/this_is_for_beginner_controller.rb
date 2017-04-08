class ThisIsForBeginnerController < ApplicationController
  def home
    @bike_info = Roadbike.new
    @maker = Maker.all
  end

  def result
  result = Roadbike.serch_mach_bike(check_params_from_home[:price_up], check_params_from_home[:price_down], check_params_from_home[:sex],
                              check_params_from_home[:color],check_params_from_home[:detail_bike_type], check_params_from_home[:detail_maker],
                              check_params_from_home[:detail_frame],check_params_from_home[:detail_component],check_params_from_home[:brake_type])
  @bike = Roadbike.serch_bike_result_and_size(result, check_params_from_home[:user_size].to_i)
  end

  def detail
   @bike =Roadbike.find_by(id: check_params_from_home[:id].to_i)
   @size = @bike.sizes.all
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
       :brake_type)
    end
end
