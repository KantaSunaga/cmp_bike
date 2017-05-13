require 'rails_helper'

RSpec.describe ColorsHelper, type: :helper do
  describe "get_maker_id_from_bike" do
    it "メーカーネームが取得できること" do
      year_info = create :year
      maker_info = create :maker,{year_id: year_info.id}
      bike_info = create :roadbike,{maker_id: maker_info.id}
      expect(helper.get_maker_id_from_bike(bike_info.maker_id)).to eq maker_info.maker_name
    end
  end
  describe "get_bike_name" do
    it "nameが取得できること" do
      year_info = create :year
      maker_info = create :maker,{year_id: year_info.id}
      bike_info = create :roadbike,{maker_id: maker_info.id}
      expect(helper.get_bike_name(bike_info.id)).to eq bike_info.bike_name
    end
  end
end
