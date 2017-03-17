require 'rails_helper'

RSpec.describe Bike, type: :model do
  describe "Bike.creating_bike_need_argument_is" do
    it '引数が以下の場合しっかり保存できているか' do
      maker_id = 1
      bike_series = "Ride"
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
      accessory = "キー,リフレクター"
      maker_url = "http://www.merida.jp/lineup/road_bike/ride_3000.html"
      shop_url  = "http://store.shopping.yahoo.co.jp/cycle-garage1/merida-2017-0004.html"
      picture = nil
      size = 50
      weight = 8.3
      price= 150000

      Bike.creating_bike_need_argument_is(maker_id, bike_series, bike_name, frame_type, component, rear_derailleur, front_derailleur,
            crank, brake, chain, sprocket, sti_lever, bb, wheel, color,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,
            maker_url, shop_url, picture, size, weight, price)
      expect(Bike.find_by(id: 1).count).to eq 1
    end
  end
end
#値段、
