class ThisIsForBeginnerController < ApplicationController
  def home
    @bike_info = Bike.new
    @maker = Maker.all
  end

  def result
 serch_params = check_params_from_home
  p params[:detail_bike_type].to_i
  p Bike.where(road_bike_type: params[:detail_bike_type].to_i)
  p serch_params
  p check_params_from_home
  # p @result_serch_from_userparams = Bike.find_by( min_height: 100..160  )
  p "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"

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
       :user_size)
    end
end
