require 'rails_helper'

RSpec.describe Bike, type: :model do
  describe "Bike.creating_bike_need_argument_is" do
    it '引数が以下の場合しっかり保存できているか' do
      maker_name = "merida"
      year = 2017
      bike_series = "Ride"
      bike_name = "Ride3000"
      frame_type = "カーボン"
      component = "105ミックス"
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
      size = 50
      weight = 8.3
      price = 150000

      Bike.creating_bike_need_argument_is(maker_name, year ,bike_series, bike_name, frame_type, component, rear_derailleur, front_derailleur,
            crank, brake, chain, sprocket, sti_lever, bb, wheel, color,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,
            maker_url, shop_url, picture, size, weight, price)
      expect(Bike.all.count).to eq 1
    end
  end
  describe "self.creating_maker_and_all_size_bike_need_argument_is" do
    it "サイズが、3個あった時、3っこレコードが存在しているか" do
      maker_name = "merida"
      year = 2017
      bike_series = "Ride"
      bike_name = "Ride3000"
      frame_type = "カーボン"
      component = "105ミックス"
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
      Bike.creating_maker_and_all_size_bike_need_argument_is(maker_name, year, bike_series, bike_name, frame_type, component, rear_derailleur, front_derailleur,
           crank, brake, chain, sprocket, sti_lever, bb, wheel, color,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,
           maker_url, shop_url, picture, size_list, weight_list, price, gear, fork)
      expect(Bike.where(bike_name:"Ride3000").length).to eq 3
    end
    it "すでにメーカーが存在していた場合" do
      Maker.create(maker_name: "merida", year: 2017)
      maker_name = "merida"
      year = 2017
      bike_series = "Ride"
      bike_name = "Ride3000"
      frame_type = "カーボン"
      component = "105ミックス"
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
      Bike.creating_maker_and_all_size_bike_need_argument_is(maker_name, year, bike_series, bike_name, frame_type, component, rear_derailleur, front_derailleur,
           crank, brake, chain, sprocket, sti_lever, bb, wheel, color,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,
           maker_url, shop_url, picture, size_list, weight_list, price, gear, fork)
      expect(Bike.where(bike_name:"Ride3000").length).to eq 3
    end
  end
end
