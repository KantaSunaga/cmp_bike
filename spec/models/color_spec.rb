require 'rails_helper'

RSpec.describe Color, type: :model do
  describe "create_color_and_picture" do
    Color.delete_all
    bike_info_1 = Roadbike.find_by(bike_name:"Ride3000")
    color_array_1 = ["red","green","blue"]
    picture_array = ["www...","ww123","wwwww"]
    Color.create_color_and_picture(color_array_1, picture_array, bike_info_1)
    bike_info_2 = Roadbike.find_by(bike_name:"defy_adovanced_sl_0")
    color_array_2 = ["yellow","green","blue"]
    Color.create_color_and_picture(color_array_2, picture_array, bike_info_2)
    bike_info_3 = Roadbike.find_by(bike_name:"CAAD12")
    color_array_3 = ["gray","green","blue"]
    Color.create_color_and_picture(color_array_3, picture_array, bike_info_3)
      it "colorが3種類、pictureも３種類あった時" do
        expect(Color.all.length).to eq 9
    end
  end
  describe "serch_roadbike_color_agument_is(bike_list, color)" do
    it "bike_listに、３つ入っていて、colorがred、中身が１つの配列を返すこと" do
      bike_list = Roadbike.all
      color = "red"
      expect(Color.serch_roadbike_color_agument_is(bike_list, color).length).to eq 1
    end
    it "bike_listに、３つ入っていて、colorがred、中身が１つの配列を返すこと" do
      bike_list = Roadbike.all
      color = "green"
      expect(Color.serch_roadbike_color_agument_is(bike_list, color).length).to eq 3
    end
  end
end
