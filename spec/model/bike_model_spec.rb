require 'rails_helper'

RSpec.describe Bike, type: :model do

  describe "self.creating_maker_and_all_size_bike_need_argument_is" do
    it "サイズが、3個あった時、bikeテーブルにレコードが１つsizeコンントローラーには３つレコードがあること" do
      maker_name = "merida"
      year = 2017
      bike_series = "Ride"
      bike_name = "Ride3000"
      frame_type = "カーボン"
      rear_derailleur = "105"
      front_derailleur = "105"
      crank = "オリジナル"
      brake = "105"
      chain = "105"
      sprocket = "105"
      sti_lever = "105ミックス"
      bb = "105ミックス"
      wheel = "FULCRUM/RACING 3"
      color ="red"
      saddle = nil
      seat_pillar =nil
      handle = "オリジナル"
      stem = "オリジナル"
      tire = "Panareser/ほげ"
      pedal = "有"
      valve = "仏式"
      accessory = "鍵,リフレクター"
      maker_url = "http://www.merida.jp/lineup/road_bike/ride_3000.html"
      shop_url  = "http://store.shopping.yahoo.co.jp/cycle-garage1/merida-2017-0004.html"
      picture = nil
      size_list = [50,55,60]
      weight_list = [8.3,8.35,8.4]
      price = 150000
      gear = 22
      fork = "FACT carbon fiber, full carbon monocoque, Zertz inserts"
      frame_name = "ABC,merida"
      fork_type = "カーボン"
      kc_or_cb ="クリンチャー"
      component ="105ミックス"
      height_list = [[160,170],[165,175],[170,185]]
      sex = false
      roade_bike_type = 1
      Bike.creating_maker_and_all_size_bike_need_argument_is(maker_name, year, bike_series, bike_name, frame_type, rear_derailleur, front_derailleur,
           crank, brake, chain, sprocket, sti_lever, bb, wheel, color,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,
           maker_url, shop_url, picture, size_list, weight_list, price, gear, fork,frame_name, fork_type, kc_or_cb, component,height_list, sex,roade_bike_type)
      expect(Bike.all.length).to eq 1
    end
    it "すでにメーカーが存在していた場合" do
      Maker.create(maker_name: "merida", year: 2017)
      maker_name = "merida"
      year = 2017
      bike_series = "Ride"
      bike_name = "Ride3000"
      frame_type = "カーボン"
      rear_derailleur = "105"
      front_derailleur = "105"
      crank = "オリジナル"
      brake = "105"
      chain = "105"
      sprocket = "105"
      sti_lever = "105ミックス"
      bb = "105ミックス"
      wheel = "FULCRUM/RACING 3"
      color ="red"
      saddle = nil
      seat_pillar =nil
      handle = "オリジナル"
      stem = "オリジナル"
      tire = "Panareser/ほげ"
      pedal = "有"
      valve = "仏式"
      accessory = "鍵,リフレクター"
      maker_url = "http://www.merida.jp/lineup/road_bike/ride_3000.html"
      shop_url  = "http://store.shopping.yahoo.co.jp/cycle-garage1/merida-2017-0004.html"
      picture = nil
      size_list = [50,55,60]
      weight_list = [8.3,8.35,8.4]
      price = 150000
      gear = 22
      fork = "FACT carbon fiber, full carbon monocoque, Zertz inserts"
      frame_name = "ABC,merida"
      fork_type = "カーボン"
      kc_or_cb ="クリンチャー"
      component ="105ミックス"
      height_list = [[160,171],[165,171],[170,181]]
      sex = false
      roade_bike_type = 1
      result = Bike.creating_maker_and_all_size_bike_need_argument_is(maker_name, year, bike_series, bike_name, frame_type, rear_derailleur, front_derailleur,
           crank, brake, chain, sprocket, sti_lever, bb, wheel, color,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,
           maker_url, shop_url, picture, size_list, weight_list, price, gear, fork, frame_name, fork_type, kc_or_cb, component,height_list,sex,roade_bike_type)
      expect(Bike.all.length).to eq 1
    end
  end
  describe "self.check_params" do
    it "バイクID＝１が４番目に含まれていた場合" do
      result = Bike.check_params(2,10 ,3 ,1)
      expect(result).to eq [2,10,3]
    end
  end

  describe "self.check_params" do
    it "bike = 1 が渡ってきた場合" do
      Maker.create(maker_name: "merida", year: 2017)
      maker_name = "merida"
      year = 2017
      bike_series = "Ride"
      bike_name = "Ride3000"
      frame_type = "カーボン"
      rear_derailleur = "105"
      front_derailleur = "105"
      crank = "オリジナル"
      brake = "105"
      chain = "105"
      sprocket = "105"
      sti_lever = "105ミックス"
      bb = "105ミックス"
      wheel = "FULCRUM/RACING 3"
      color ="red"
      saddle = nil
      seat_pillar =nil
      handle = "オリジナル"
      stem = "オリジナル"
      tire = "Panareser/ほげ"
      pedal = "有"
      valve = "仏式"
      accessory = "鍵,リフレクター"
      maker_url = "http://www.merida.jp/lineup/road_bike/ride_3000.html"
      shop_url  = "http://store.shopping.yahoo.co.jp/cycle-garage1/merida-2017-0004.html"
      picture = nil
      size_list = [50,55,60]
      weight_list = [8.3,8.35,8.4]
      price = 150000
      gear = 22
      fork = "FACT carbon fiber, full carbon monocoque, Zertz inserts"
      frame_name = "ABC,merida"
      fork_type = "カーボン"
      kc_or_cb ="クリンチャー"
      component ="105ミックス"
      height_list = [[160,170],[165,175],[170,185]]
      sex = false
      roade_bike_type = 1
      result = Bike.creating_maker_and_all_size_bike_need_argument_is(maker_name, year, bike_series, bike_name, frame_type, rear_derailleur, front_derailleur,
           crank, brake, chain, sprocket, sti_lever, bb, wheel, color,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,
           maker_url, shop_url, picture, size_list, weight_list, price, gear, fork, frame_name, fork_type, kc_or_cb, component,height_list,sex,roade_bike_type)
      expect(Bike.get_bike_info_from([1]).length).to eq 1
    end
  end
end
