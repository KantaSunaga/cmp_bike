module ApplicationHelper
  def  get_maker_id_from_bike(bike_maker_id)
    maker_info = Maker.find_by(id: bike_maker_id)
    return maker_info.maker_name
  end
  def get_bike_name(bike_id)
    bike = Roadbike.find_by(id: bike_id)
    return bike.bike_name
  end
end
