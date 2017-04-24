require 'rails_helper'

RSpec.describe ThisIsForBeginnerHelper, type: :helper do
  describe "find_brake_type" do
    it "ブレーキタイプがディスクだった場合" do
     brake_type = 2
     expect(find_brake_type(brake_type)).to eq "ディスクブレーキ"
  end
    it "ブレーキタイプがリムだった場合" do
      brake_type = 1
      expect(find_brake_type(brake_type)).to eq "リムブレーキ"
    end
  end
  describe "chek_roade_bike_type_from" do
    it "road_bike_type = 1だった場合" do
      road_bike_type = 1
      expect( chek_roade_bike_type_from(road_bike_type)).to eq "ロングライド"
    end
  end
end
