class ThisIsForBeginnerController < ApplicationController
  def home
    @bike_info = Bike.new
  end

  def result
  # @result_serch_from_userparams = Bike.serch_bike_from_user_params(params[:bike_type],params[:detail_frame],params[:detail_bike_type],
  #                                                                   params[:detail_component],params[:price_down],params[:price_up],
  #                                                                   params[:color],params[:sex],params[:user_size_up],params[:user_size_down])
  p "]]]]]]]]]]]]]]]]]]]]]]]]]"
  p @result_serch_from_userparams = Bike.find_by( min_height: 100..160  )
  # find_bik_from_sex_param(params[:sex]).find_bik_from_size_param(params[:user_size_up],params[:user_size_down])
  end
end
# bike_type, frame_type,road_bike_type, component,
#                                 price_down,price_up,color,sex,user_size_up,user_size_down)
#
#                                 "bike_type"=>"1", "detail_frame"=>"カーボン", "detail_bike_type"=>"", "detail_component"=>"",
#                                  "price_down"=>"", "price_up"=>"",
#                                  "color"=>"", "sex"=>"", "user_size_down"=>"150", "user_size_up"=>"155"
