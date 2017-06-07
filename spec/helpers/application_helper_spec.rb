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

  describe "pedal?" do
    it "trueだったらありを返すこと" do
        expect(pedal?(true)).to eq "あり"
    end
    it "falseだったらなしを返すこと" do
        expect(pedal?(false)).to eq "なし"
    end
  end

  describe "fork_type" do
    it "1だったらカーボンを返すこと" do
        expect(fork_type(1)).to eq "カーボン"
    end
    it "２だったらアルミを返すこと" do
        expect(fork_type(2)).to eq "アルミ"
    end
    it "3だったらクロモリを返すこと" do
        expect(fork_type(3)).to eq "クロモリ"
    end
  end

  describe "tire_type" do
    it "1だったらクリンチャーを返すこと" do
        expect(tire_type(1)).to eq "クリンチャー"
    end
    it "２だったらチューブラーを返すこと" do
        expect(tire_type(2)).to eq "チューブラー"
    end
    it "3だったらチューブレスを返すこと" do
        expect(tire_type(3)).to eq "チューブレス"
    end
  end

  describe "valve" do
    it "1だったら仏式を返すこと" do
        expect(valve(1)).to eq "仏式"
    end
    it "２だったら英式を返すこと" do
        expect(valve(2)).to eq "英式"
    end
    it "3だったら米式を返すこと" do
        expect(valve(3)).to eq "米式"
    end
  end
end
