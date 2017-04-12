class ThisIsForIntermediateOrAdvancedController < ApplicationController
  def home
    @bikes_info = Roadbike.new
  end

  def get_bike_name
    @bikes = Roadbike.where(maker_id: params[:maker_id])
  end

  def get_bike_name_1
    @bikes_1 = Roadbike.where(maker_id: params[:maker_id])
  end

  def get_bike_name_2
    @bikes_2 = Roadbike.where(maker_id: params[:maker_id])
  end

  def get_bike_name_3
    @bikes_3 = Roadbike.where(maker_id: params[:maker_id])
  end

  def cmp_result
    @bike_info_from_params = Roadbike.new
    result_check_params = Roadbike.check_params(params[:bike_id],params[:bike_id_1],
                                            params[:bike_id_2],params[:bike_id_3])
      @bike_info_from_params = Roadbike.get_bike_info_from(result_check_params)
  end
end
