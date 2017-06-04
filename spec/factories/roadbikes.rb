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
     pedal  true
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
     fork_type  1
     tire_type 1
     component "105ミックス"
     height_list  [[160,170],[165,175],[170,185]]
     sex  false
     roade_bike_type  1
  end
  factory :roadbike do
    maker_id 1
    bike_series "domane"
    bike_name "domane 1"
    frame_type 1
    rear_derailleur "SHIMANO/105"
    front_derailleur "SHIMANO/105"
    crank "SHIMANO/105"
    brake "SHIMANO/105"
    chain "SHIMANO/105"
    sprocket "SHIMANO/105"
    sti_lever "SHIMANO/105"
    bb "SHIMANO/105"
    wheel "ZONDA"
    saddle "テストサドル"
    seat_pillar "テストピラー"
    handle "テストハンドル"
    stem "テストステム"
    tire "テストタイヤ"
    pedal true
    accessory "なし"
    maker_url "https://www.google.co.jp/search?q=csv+rails&oq=csv+rails&aqs=chrome..69i57j69i61j69i59l3j0.5571j1j7&sourceid=chrome&ie=UTF-8"
    shop_url "http://www.sejuku.net/blog/15982"
    picture "http://www.sejuku.net/blog/wp-content/uploads/2016/12/babashun_avatar_1480932922-100x100.jpg"
    price 10000
    gear 22
    fork "テストフォーク"
    frame_name "テストフレーム"
    fork_type 1
    tire_type 1
    component 1
    bike_type 1
    sex false
    road_bike_type 1
    brake_type 1
    bike_comment "テストバイクコメント"
  end
end
