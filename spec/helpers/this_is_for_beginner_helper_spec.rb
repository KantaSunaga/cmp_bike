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
    it "road_bike_type = ２だった場合" do
      road_bike_type = 2
      expect( chek_roade_bike_type_from(road_bike_type)).to eq "エンデュランス"
    end
    it "road_bike_type = 3だった場合" do
      road_bike_type = 3
      expect( chek_roade_bike_type_from(road_bike_type)).to eq "エアロバイク"
    end
  end
  describe "find_maker_name_from" do
    # let(:year_info){create :year,{year: 2017}}
    # let(:maker){create :maker,{maker_name: "テスト", year_id: year_info.id, maker_comment:"ホゲホゲ"}}
    # let(:bike){create :bike,{maker_id: maker.id }}
    it "bikenameがhogeを取得すること" do
      year_info = create :year,{year: 2017}
      maker = create :maker,{maker_name: "テスト", year_id: year_info.id, maker_comment:"ホゲホゲ"}
      bike = create :roadbike,{maker_id: maker.id }
      expect(find_maker_name_from(bike.maker_id)).to eq maker
    end
  end

  describe "chek_bike_type_from(bike_type)" do
    it "bike_type が 1の時" do
      bike_type = 1
      expect(chek_bike_type_from(bike_type)).to eq "ロードバイク"
    end
    it "ike_type が 2の時" do
      bike_type = 2
      expect(chek_bike_type_from(bike_type)).to eq "マウンテンバイク"
    end
    it "ike_type が 3の時" do
      bike_type = 3
      expect(chek_bike_type_from(bike_type)).to eq "クロスバイク"
    end
    it "ike_type が ４の時" do
      bike_type = 4
      expect(chek_bike_type_from(bike_type)).to eq "ピストバイク"
    end
    it "ike_type が 5の時" do
      bike_type = 5
      expect(chek_bike_type_from(bike_type)).to eq "ミニベロ"
    end
    it "ike_type が 6の時" do
      bike_type = 6
      expect(chek_bike_type_from(bike_type)).to eq "シティサイクル"
    end
    it "ike_type が 7の時" do
      bike_type = 7
      expect(chek_bike_type_from(bike_type)).to eq "折りたたみ自転車"
    end
    it "ike_type が 8の時" do
      bike_type = 8
      expect(chek_bike_type_from(bike_type)).to eq "電動アシスト自転車"
    end
    it "ike_type が ９の時" do
      bike_type = 9
      expect(chek_bike_type_from(bike_type)).to eq "シクロクロス"
    end
    it "ike_type が １０の時" do
      bike_type = 10
      expect(chek_bike_type_from(bike_type)).to eq "TTバイク"
    end
  end
  describe "get_all_size(size_record)" do
    year_info = Year.create(year:2017)
    maker_info = Maker.create(maker_name: "テスト", year_id: year_info.id, maker_comment:"ホゲホゲ")
    bike_info = Roadbike.create(bike_name: "hoge", maker_id: maker_info.id)
    it "50cmが帰ってくること" do

    size =[]
    size1 = Size.create(
                         size: 50,
                         min_height: 150,
                         max_height: 165,
                         weight: 6,
                         roadbike_id: bike_info.id
                        )
    size << size1
    expect(get_all_size(size)).to eq " 50cm"
    end
  end
  describe "chek_frame_type_from" do
    it "bike_frame が 1だった場合" do
      bike_frame = 1
      expect(chek_frame_type_from(bike_frame)).to eq "カーボン"
    end
    it "bike_frame が ２だった場合" do
      bike_frame = 2
      expect(chek_frame_type_from(bike_frame)).to eq "アルミ"
    end
    it "bike_frame が 3だった場合" do
      bike_frame = 3
      expect(chek_frame_type_from(bike_frame)).to eq "クロモリ"
    end
  end

  describe "chek_compornent_from(compornent)" do
    it "compornent が1だった場合" do
      compornent = 1
      expect(chek_compornent_from(compornent)).to eq "SRAM/S-Series"
    end
    it "compornent が2だった場合" do
      compornent = 2
      expect(chek_compornent_from(compornent)).to eq "SRAM/Apex"
    end
    it "compornent が3だった場合" do
      compornent = 3
      expect(chek_compornent_from(compornent)).to eq "SRAM/Apex 1"
    end
    it "compornent が4だった場合" do
      compornent = 4
      expect(chek_compornent_from(compornent)).to eq "SRAM/Rival"
    end
    it "compornent が5だった場合" do
      compornent = 5
      expect(chek_compornent_from(compornent)).to eq "SRAM/Rival 1"
    end
    it "compornent が6だった場合" do
      compornent = 6
      expect(chek_compornent_from(compornent)).to eq "SRAM/Force"
    end
    it "compornent が7だった場合" do
      compornent = 7
      expect(chek_compornent_from(compornent)).to eq "SRAM/Force 1"
    end
    it "compornent が8だった場合" do
      compornent = 8
      expect(chek_compornent_from(compornent)).to eq "SRAM/RED"
    end
    it "compornent が9だった場合" do
      compornent = 9
      expect(chek_compornent_from(compornent)).to eq "SRAM/RED eTAP"
    end
    it "compornent が10だった場合" do
      compornent = 10
      expect(chek_compornent_from(compornent)).to eq "SHIMANO/DURA-ACE"
    end
    it "compornent が11だった場合" do
      compornent = 11
      expect(chek_compornent_from(compornent)).to eq "SHIMANO/ULTEGRA"
    end
    it "compornent が11だった場合" do
      compornent = 12
      expect(chek_compornent_from(compornent)).to eq "SHIMANO/105"
    end
    it "compornent が13だった場合" do
      compornent = 13
      expect(chek_compornent_from(compornent)).to eq "SHIMANO/TIAGRA"
    end
    it "compornent が14だった場合" do
      compornent = 14
      expect(chek_compornent_from(compornent)).to eq  "SHIMANO/SORA"
    end
    it "compornent が15だった場合" do
      compornent = 15
      expect(chek_compornent_from(compornent)).to eq  "SHIMANO/CLARIS"
    end
    it "compornent が16だった場合" do
      compornent = 16
      expect(chek_compornent_from(compornent)).to eq  "SHIMANO/DURA-ACE DI2"
    end
    it "compornent が17だった場合" do
      compornent = 17
      expect(chek_compornent_from(compornent)).to eq  "SHIMANO/ULTEGRA DI2"
    end
    it "compornent が18だった場合" do
      compornent = 18
      expect(chek_compornent_from(compornent)).to eq  "CAMPAGNOLO/SuperRecord EPS"
    end
    it "compornent が19だった場合" do
      compornent = 19
      expect(chek_compornent_from(compornent)).to eq  "CAMPAGNOLO/SuperRecord"
    end
    it "compornent が20だった場合" do
      compornent = 20
      expect(chek_compornent_from(compornent)).to eq  "CAMPAGNOLO/Record EPS"
    end
    it "compornent が21だった場合" do
      compornent = 21
      expect(chek_compornent_from(compornent)).to eq  "CAMPAGNOLO/Record"
    end
    it "compornent が22だった場合" do
      compornent = 22
      expect(chek_compornent_from(compornent)).to eq  "CAMPAGNOLO/Chorus EPS"
    end
    it "compornent が23だった場合" do
      compornent = 23
      expect(chek_compornent_from(compornent)).to eq  "CAMPAGNOLO/Chorus"
    end
    it "compornent が24だった場合" do
      compornent = 24
      expect(chek_compornent_from(compornent)).to eq  "CAMPAGNOLO/Athena"
    end
    it "compornent が25だった場合" do
      compornent = 25
      expect(chek_compornent_from(compornent)).to eq  "CAMPAGNOLO/Potenza"
    end
    it "compornent が26だった場合" do
      compornent = 26
      expect(chek_compornent_from(compornent)).to eq  "CAMPAGNOLO/Veloce"
    end
  end

  describe "find_picture"do
    year_info = Year.create(year:2017)
    maker_info = Maker.create(maker_name: "テスト", year_id: year_info.id, maker_comment:"ホゲホゲ")
    bike_info = Roadbike.create(bike_name: "hoge", maker_id: maker_info.id)
   Color.delete_all
    it "カラーがredだった場合" do
      Color.create(color: "red",picture: "gagaga", roadbike_id: bike_info.id)
      expect(find_picture("red", bike_info.id)).to eq  "gagaga"
    end
    it "カラーが0だった場合" do
      Color.create(color: "red",picture: "あああ", roadbike_id: bike_info.id)
      expect(find_picture("0", bike_info.id)).to eq  "あああ"
    end
  end

  describe "find_color" do
    year_info = Year.create(year:2017)
    maker_info = Maker.create(maker_name: "テスト", year_id: year_info.id, maker_comment:"ホゲホゲ")
    bike_info = Roadbike.create(bike_name: "hoge", maker_id: maker_info.id)
    Color.create(color: "あああ", roadbike_id: bike_info.id, official_color: "テストレッド")

    it "メインcolor があああの場合" do
      expect(find_color(bike_info.id, "あああ")).to eq  "テストレッド"
    end
    it "subcolor がいいいの場合" do
      Color.create(sub_color: "いいい", roadbike_id: bike_info.id, official_color: "テストブルー")
      expect(find_color(bike_info.id, "いいい")).to eq  "テストブルー"
    end
    it "sub_color2 がうううの場合" do
      Color.create(sub_color2: "ううう", roadbike_id: bike_info.id, official_color: "テストグリーン")
      expect(find_color(bike_info.id, "ううう")).to eq  "テストグリーン"
    end
    it "colorが0の場合" do
      Color.create(color: "ががが", roadbike_id: bike_info.id, official_color: "テストブラック")
      expect(find_color(bike_info.id, "0")).to eq  "テストレッド,テストブラック"
    end
  end
  describe "which_sex" do
    it "trueだった場合" do
      sex = true
      expect(which_sex(sex)).to eq  "女性モデル"
    end
    it "trueだった場合" do
      sex = false
      expect(which_sex(sex)).to eq  "男性モデル"
    end
  end
end
