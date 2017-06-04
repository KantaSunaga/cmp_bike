module ApplicationHelper
  def  get_maker_id_from_bike(bike_maker_id)
    maker_info = Maker.find_by(id: bike_maker_id)
    return maker_info.maker_name
  end
  def get_bike_name(bike_id)
    bike = Roadbike.find_by(id: bike_id)
    return bike.bike_name
  end
  def pedal?(boolean)
      return "あり" if boolean
      return "なし"
  end
  def fork_type(fork_type)
    if fork_type == 1
      return "カーボン"
    elsif fork_type == 2
      return "アルミ"
    elsif fork_type == 3
      return "クロモリ"
    end
  end

  def tire_type(tire_type)
    if tire_type == 1
      return "クリンチャー"
    elsif tire_type == 2
       return "チューブラー"
    elsif tire_type == 3
      return "チューブレス"
    end
  end

  def valve(valve)
    if valve == 1
      return "仏式"
    elsif valve == 2
       return "英式"
    elsif valve == 3
      return "米式"
    end
  end
end
