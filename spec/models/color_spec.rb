require 'rails_helper'

RSpec.describe Color, type: :model do
  describe "create_color_and_picture" do
      it "colorが3種類、pictureも３種類あった時" do
        Color.delete_all
        bike_info = Roadbike.find_by(wheel: "FULCRUM/RACING 3")
        color_array = ["red","green","blue"]
        picture_array = ["www...","ww123","wwwww"]
        Color.create_color_and_picture(color_array, picture_array, bike_info)
        expect(Color.all.length).to eq 3
    end
  end
  describe "serch_roadbike_color_agument_is(bike_obj, color_info)" do
    picture_array = ["www...","ww123","wwwww"]
    color_array = ["red","green","brue"]
    bike_info = Roadbike.find_by(wheel: "FULCRUM/RACING 3")
    Color.create_color_and_picture(color_array, picture_array, bike_info)
    it "bike_objが３つ、カラーがredで一つ見つかる場合" do
      color_info = "red"
      expect(Color.serch_roadbike_color_agument_is(bike_info, color_info).length).to eq 1
    end
    it "bike_objが３つ、カラーがgreenで1つ見つかる場合" do
       color_info = "green"
       expect(Color.serch_roadbike_color_agument_is(bike_info, color_info).length).to eq 1
    end
    it "bike_objが３つ、カラーがblueで1つ見つかる場合" do
        color_info = "blue"
        expect(Color.serch_roadbike_color_agument_is(bike_info, color_info).length).to eq 1
    end
  end
end
