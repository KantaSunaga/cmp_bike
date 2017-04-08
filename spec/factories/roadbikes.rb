FactoryGirl.define do
   factory :bike do
     maker_name  "merida"
     year  2017
     bike_series  "Ride"
     bike_name  "Ride3000"
     frame_type  1
     rear_derailleur  "105"
     front_derailleur  "105"
     crank  "オリジナル"
     brake  "105"
     chain  "105"
     sprocket  "105"
     sti_lever  "105ミックス"
     bb  "105ミックス"
     wheel  "FULCRUM/RACING 3"
     color "red"
     saddle  nil
     seat_pillar nil
     handle  "オリジナル"
     stem  "オリジナル"
     tire  "Panareser/ほげ"
     pedal  "有"
     valve  "仏式"
     accessory  "鍵,リフレクター"
     maker_url  "http://www.merida.jp/lineup/road_bike/ride_3000.html"
     shop_url   "http://store.shopping.yahoo.co.jp/cycle-garage1/merida-2017-0004.html"
     picture  nil
     size_list  [50,55,60]
     weight_list  [8.3,8.35,8.4]
     price  150000
     gear  22
     fork  "FACT carbon fiber, full carbon monocoque, Zertz inserts"
     frame_name  "ABC,merida"
     fork_type  "カーボン"
     kc_or_cb "クリンチャー"
     component "105ミックス"
     height_list  [[160,170],[165,175],[170,185]]
     sex  false
     roade_bike_type  1
  end
end
