class ThisIsForIntermediateOrAdvancedController < ApplicationController
  def home
  end

  def get_bike_name
    @bikes = Bike.where(maker_id: params[:maker_id])
  end

  def get_bike_name_1
    @bikes_1 = Bike.where(maker_id: params[:maker_id])
  end

  def get_bike_name_2
    @bikes_2 = Bike.where(maker_id: params[:maker_id])
  end

  def get_bike_name_3
    @bikes_3 = Bike.where(maker_id: params[:maker_id])
  end
end
