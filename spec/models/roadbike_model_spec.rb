require 'rails_helper'

RSpec.describe Roadbike, type: :model do
  Roadbike.delete_all
  Maker.delete_all
  Color.delete_all
  all_bike_info_hash_list =[]

  ride3000_bike_info_hash = {maker_name:"MERIDA",
                             year:2017,
                             bike_series: "Ride",
                             bike_name:"Ride3000",
                             frame_type: 1,
                             rear_derailleur: "リアだよ",
                             front_derailleur:"フロントだよ",
                             cranc:"クランクだよ",
                             brake:"ブレーキだよ",
                             chain:"チェーンだよ",
                             sprocket:"スプロケだよ",
                             sti_lever:"レバーだよ",
                             bb: "bbだよ",
                             wheel: "FULCRUM/RACING 3",
                             saddle: "オリジナル",
                             seat_pillar:"オリジナル",
                             handle: "オリジナル", stem: "オリジナル",
                             tire: "Panareser/ほげ",
                             pedal: "有",
                             valve: "仏式",
                             accessory: "鍵,リフレクター",
                             maker_url: "http://www.merida.jp/lineup/road_bike/ride_3000.html",
                             shop_url: "http://store.shopping.yahoo.co.jp/cycle-garage1/merida-2017-0004.html",
                             size_list: [50,55,60] ,
                             weight_list: [6.8,6.85,6.9],
                             price: 150000,
                             gear: 22,
                             fork: "FACT carbon fiber, full carbon monocoque, Zertz inserts",
                             frame_name: "merida ride sp",
                             fork_type: "カーボン",
                             kc_or_cb: "クリンチャー",
                             component: 12,
                             height_list:[[150,165],[155,170],[160,175]],
                             sex:false,
                             road_bike_type:1,
                             brake_type: 2,
                             color_list: [["red","green"],["black","green"],["orange"]],
                             picture_list: ["red,green_picture","black,gree_picture,","white_picture"],
                             official_color: ["Matte Trek Black/Pink/Yellow-P1","Charcoal/Black/Green-P1","Viper Red/Shady Grey/Black-P1"],
                             bike_comment: "世界でもっとも重いロードドバイクです。",
                             maker_comment: "ウェーイwwwwwwwwwwwwwwwwwwwwwwwwp@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
                           }

   all_bike_info_hash_list << ride3000_bike_info_hash

   defy_adovanced_sl_0_bike_info_hash = { maker_name:"GIANT",
                                          year:2017,
                                          bike_series: "DEFY",
                                          bike_name:"defy_adovanced_sl_0",
                                          frame_type: 2,
                                          rear_derailleur: "リアだよ",
                                          front_derailleur:"フロントだよ",
                                          cranc:"クランクだよ",
                                          brake:"ブレーキだよ",
                                          chain:"チェーンだよ",
                                          sprocket:"スプロケだよ",
                                          sti_lever:"レバーだよ",
                                          bb: "bbだよ",
                                          wheel:"FULCRUM/RACING 3",
                                          saddle:"オリジナル",
                                          seat_pillar:"フレーム一体型",
                                          handle:	"GIANT CONTACT SLR Carbon 31.8",
                                          stem:"GIANT CONTACT SLR",
                                          tire: "GIANT GAVIA SLR 700x25C TUBELESS READY",
                                          pedal:"無",
                                          valve:"仏式",
                                          accessory:"RideSense、ベル、チューブレスバルブ、シーラント",
                                          maker_url:"http://www.giant.co.jp/giant17/bike_datail.php?p_id=00000029#specifications",
                                          shop_url:"hoge",
                                          size_list: [45,55,65] ,
                                          weight_list: [7.8,7.85,7.9],
                                          price:750000,
                                          gear:22,
                                          fork:"Advanced SL-Grade Composite，Full Composite OverDrive 2 Column",
                                          frame_name: "ジャイアントフレーム",
                                          fork_type: "ダイヤモンド",
                                          kc_or_cb: "クリンチャー",
                                          component: 14,
                                          height_list:[[150,160],[155,165],[160,170]],
                                          sex:false,
                                          road_bike_type:1,
                                          brake_type: 1,
                                          color_list: [["red","green"],["black","green"],["white"]],
                                          picture_list: ["red,green_picture","black,gree_picture,","white_picture"],
                                          official_color: ["Matte Trek Black/Pink/Yellow-P1","Charcoal/Black/Green-P1","Viper Red/Shady Grey/Black-P1"],
                                          bike_comment: "世界でもっとも美味しいロードドバイクです。",
                                          maker_comment: "白石峠わずwwwwwwwwwwwwwwwwwwwwwwwwp@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
                                        }

 all_bike_info_hash_list << defy_adovanced_sl_0_bike_info_hash

    cacd12_bike_info_hash = {maker_name:"CANNONDEL",
                             year:2017,
                             bike_series: "CAAD",
                             bike_name:"CAAD12",
                             frame_type: 3,
                             rear_derailleur: "リアだよ",
                             front_derailleur:"フロントだよ",
                             cranc:"クランクだよ",
                             brake:"ブレーキだよ",
                             chain:"チェーンだよ",
                             sprocket:"スプロケだよ",
                             sti_lever:"レバーだよ",
                             bb: "bbだよ",
                             wheel: "FULCRUM/RACING 3",
                             saddle: "オリジナル",
                             seat_pillar:"オリジナル",
                             andle: "オリジナル",
                             stem: "オリジナル",
                             tire: "Panareser/ほげ",
                             pedal: "有",
                             valve: "仏式",
                             accessory: "ライト",
                             maker_url: "http://www.merida.jp/lineup/road_bike/ride_3000.html",
                             shop_url: "http://store.shopping.yahoo.co.jp/cycle-garage1/merida-2017-0004.html",
                             size_list: [50,55,60] ,
                             weight_list: [6.8,6.85,6.9],
                             price: 150000,
                             gear: 22,
                             fork: "FACT carbon fiber, full carbon monocoque, Zertz inserts",
                             frame_name: "caadd 12 sp",
                             fork_type: "カーボン",
                             kc_or_cb: "クリンチャー",
                             component: 10,
                             height_list:[[150,165],[155,170],[160,175]],
                             sex:true,
                             road_bike_type:1,
                             brake_type: 2,
                             color_list: [["red","green"],["black","green"],["white"]],
                             picture_list: ["red,green_picture","black,gree_picture,","white_picture"],
                             official_color: ["Matte Trek Black/Pink/Yellow-P1","Charcoal/Black/Green-P1","Viper Red/Shady Grey/Black-P1"],
                             bike_comment: "世界でもっとも赤いロードドバイクです。",
                             maker_comment: "一人暮らしウェーイwwwwwwwwwwwwwwwwwwwwwwwwp@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

                          }

    all_bike_info_hash_list << cacd12_bike_info_hash

    all_bike_info_hash_list.each do |bike_info_hash|

   Roadbike.creating_maker_and_all_size_bike_need_argument_is(bike_info_hash[:maker_name], bike_info_hash[:year], bike_info_hash[:bike_series],
                                                          bike_info_hash[:bike_name], bike_info_hash[:frame_type],bike_info_hash[:rear_derailleur],
                                                          bike_info_hash[:front_derailleur],bike_info_hash[:cranc], bike_info_hash[:brake],
                                                          bike_info_hash[:chain], bike_info_hash[:sprocket],bike_info_hash[:sti_lever],bike_info_hash[:bb],
                                                          bike_info_hash[:wheel],bike_info_hash[:saddle],bike_info_hash[:seat_pillar],bike_info_hash[:handle],
                                                          bike_info_hash[:stem], bike_info_hash[:tire], bike_info_hash[:pedal],bike_info_hash[:valve],
                                                          bike_info_hash[:accessory],bike_info_hash[:maker_url],bike_info_hash[:shop_url],
                                                          bike_info_hash[:size_list],bike_info_hash[:weight_list],bike_info_hash[:price], bike_info_hash[:gear],
                                                          bike_info_hash[:fork],bike_info_hash[:frame_name],bike_info_hash[:fork_type], bike_info_hash[:kc_or_cb],
                                                          bike_info_hash[:component],bike_info_hash[:height_list],bike_info_hash[:sex],bike_info_hash[:road_bike_type],
                                                          bike_info_hash[:brake_type],bike_info_hash[:color_list], bike_info_hash[:picture_list],bike_info_hash[:official_color],
                                                          bike_info_hash[:bike_comment],bike_info_hash[:maker_comment])
  end


  describe "self.creating_maker_and_all_size_bike_need_argument_is" do
    it "サイズが、3個あった時、bikeテーブルにレコードが１つsizeコンントローラーには３つレコードがあること" do
      expect(Roadbike.all.length).to eq 3
    end
    it "すでにメーカーが存在していた場合" do
      expect(Roadbike.all.length).to eq 3
    end
    it "サイズがが作られていること" do
      bike = Roadbike.find_by(bike_name:"CAAD12")
      expect(bike.sizes.all.length).to eq 3
    end
    it "色が作られていること" do
      expect(Color.where(sub_color: "green").length).to eq 6
    end
    it "official_colorが保存されていること" do
      expect(Color.where( official_color: "Matte Trek Black/Pink/Yellow-P1").length).to eq 3
    end
    it "バイクコメントで絞れること" do
      expect(Roadbike.where(bike_comment: "世界でもっとも赤いロードドバイクです。").length).to eq 1
    end
    it "メーカーコメントで絞れること" do
      comment = "一人暮らしウェーイwwwwwwwwwwwwwwwwwwwwwwwwp@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
      expect(Maker.where(maker_comment: comment).length).to eq 1
    end
  end
  describe "self.check_params" do
    it "バイクID＝１が４番目に含まれていた場合" do
      result = Roadbike.check_params(2,10 ,3 ,1)
      expect(result).to eq [2,10,3]
    end
  end

  describe "self.check_params" do
    it "bike = 1 が渡ってきた場合" do
      expect(Roadbike.get_bike_info_from([1]).length).to eq 1
    end
  end

  describe "serch_mach_bike(price_up, price_down,sex,road_bike_type,maker_id,frame_type)" do
    price_up = 10_00_000
    price_down = 10_000
    sex = "men"
    color = nil
    it "detetailが詳細条件のパラメーターが全てnilだった場合" do
      road_bike_type = nil
      maker_id = nil
      frame_type = nil
      component_param = nil
      brake_type = nil
      expect(Roadbike.serch_mach_bike(price_up, price_down,sex,road_bike_type,maker_id,frame_type,component_param,brake_type,color).length).to eq 2
    end
    it "detetailがroad_bike_type以外のパラメーターがnilだった場合" do
      road_bike_type = 1
      maker_id = nil
      frame_type = nil
      component_param = nil
      brake_type = nil
      expect(Roadbike.serch_mach_bike(price_up, price_down,sex,road_bike_type,maker_id,frame_type,component_param,brake_type,color).length).to eq 2
    end
    it "component_paramで絞れること" do
      road_bike_type = nil
      maker_id = nil
      frame_type = nil
      component_param = 14
      brake_type = nil
      expect(Roadbike.serch_mach_bike(price_up, price_down,sex,road_bike_type,maker_id,frame_type,component_param,brake_type,color).length).to eq 1
    end
    it "メーカーで絞れること" do
      maker_info = Maker.find_by(maker_name: "MERIDA")
      road_bike_type = nil
      maker_id = maker_info.id
      frame_type = nil
      component_param = nil
      brake_type = nil
      expect(Roadbike.serch_mach_bike(price_up, price_down,sex,road_bike_type,maker_id,frame_type,component_param,brake_type,color).length).to eq 1
    end
    it "brake_typeで絞れること" do
      road_bike_type = nil
      maker_id = nil
      frame_type = nil
      component_param = nil
      brake_type = 2
      expect(Roadbike.serch_mach_bike(price_up, price_down,sex,road_bike_type,maker_id,frame_type,component_param,brake_type,color).length).to eq 1
    end
    it "全てのdetailパラメーターが存在した場合" do
      road_bike_type = 1
      maker_info = Maker.find_by(maker_name:"MERIDA")
      maker_id = maker_info.id
      frame_type = 1
      price_up = 10_00_000
      price_down = 10_000
      sex = "men"
      component_param = 12
      brake_type = 2
      expect(Roadbike.serch_mach_bike(price_up, price_down,sex,road_bike_type,maker_id,frame_type,component_param,brake_type,color).length).to eq 1
    end
    it "colorで絞れること" do
      price_up = 10_00_000
      price_down = 10_000
      road_bike_type = nil
      maker_id = nil
      frame_type = nil
      component_param = nil
      brake_type = nil
      color = "white"
      expect(Roadbike.serch_mach_bike(price_up, price_down,sex,road_bike_type,maker_id,frame_type,component_param,brake_type,color).length).to eq 1
    end
    it "sub_colorで絞れること" do
      color = "red"
      road_bike_type = nil
      maker_id = nil
      frame_type = nil
      component_param = nil
      brake_type = nil
      sub_color = "green"
      expect(Roadbike.serch_mach_bike(price_up, price_down,sex,road_bike_type,maker_id,frame_type,component_param,brake_type,color,sub_color).length).to eq 3
    end
  end
end

  describe "self.serch_bike_result_and_size(bike_arry, user_size)" do
    price_up = 10_00_000
    price_down = 10_000
    sex = "men"
    color = "red"
      it "bike_arryがtrue,user_sizeが１６５だった場合" do
        user_size = 165
        road_bike_type = nil
        maker_id = nil
        frame_type = nil
        component_param = nil
        brake_type = nil
        color = nil
        bike_arry = Roadbike.serch_mach_bike(price_up, price_down,sex,road_bike_type,maker_id,frame_type,component_param,brake_type,color)
        expect(Roadbike.serch_bike_result_and_size(bike_arry, user_size).length).to eq 2
      end
      it "bike_arry = nilだった場合" do
        user_size = 165
        bike_arry = nil
        expect(Roadbike.serch_bike_result_and_size(bike_arry, user_size)).to eq nil
      end
      it "bike_arryがtrue,user_sizeが１10で、サイズがなかった場合" do
        user_size = 110
        road_bike_type = nil
        maker_id = nil
        frame_type = nil
        component_param = nil
        brake_type = nil
        bike_arry = Roadbike.serch_mach_bike(price_up, price_down,sex,road_bike_type,maker_id,frame_type,component_param,brake_type,color)
        expect(Roadbike.serch_bike_result_and_size(bike_arry, user_size)).to eq nil
      end
    end
      describe "which_sex?" do
        it "男性（false）が帰ってきてほしい場合" do
          expect(Roadbike.which_sex?("man")).to eq false
         end
       end
