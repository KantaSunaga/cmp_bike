class ThisIsForBeginnerController < ApplicationController
  def home
    @bike_info = Bike.new
  end

  def result
 serch_params = check_params_from_home
  p serch_params
  # p @result_serch_from_userparams = Bike.find_by( min_height: 100..160  )

  end

  private
    def check_params_from_home
      params.permit(
       :bike_type,
       :frame_type,
       :road_bike_type,
       :component,
       :price_down,
       :price_up,
       :color,
       :sex,
       :user_size_up,
       :user_size_down)

    end
end
