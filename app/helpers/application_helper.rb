module ApplicationHelper
  def  get_maker_id_from_bike(bike_maker_id)
    maker_info = Maker.find_by(id: bike_maker_id)
    return maker_info.maker_name
  end
end
