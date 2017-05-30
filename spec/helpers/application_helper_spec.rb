require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  before do
    Maker.delete_all
    Year.delete_all
  end
  describe "get_maker_id_from_bike" do
    it "bike_maker_idが１だった場合" do
      year_info = Year.create(year:2017)
      maker_info = Maker.create(maker_name: "テスト", year_id: year_info.id, maker_comment:"ホゲホゲ")
      expect(helper.get_maker_id_from_bike(maker_info.id)).to eq "テスト"
    end
  end
  describe "get_bike_name" do
    it "bikenameがhogeを取得すること" do
      year_info = Year.create(year:2017)
      maker_info = Maker.create(maker_name: "テスト", year_id: year_info.id, maker_comment:"ホゲホゲ")
      bike_info = Roadbike.create(bike_name: "hoge", maker_id: maker_info.id)
      expect(get_bike_name(bike_info.id)).to eq "hoge"
    end
  end
end
