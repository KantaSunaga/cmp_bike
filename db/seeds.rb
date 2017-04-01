# This file should contain  all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#これに自転車のサイズ、重量以外のデータを入れるーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
# hoge_bike_info_hash = {maker_name:"", year:2017, bike_series:"" ,bike_name:"",
#                            frame_type:"" , rear_derailleur:"" ,
#                            front_derailleur:"",cranc:"",brake:"",chain:"",sprocket:"",sti_lever:"",
#                            bb:"" , wheel:"" , color:"", saddle:"" , seat_pillar:"", handle:"" , stem:"" ,
#                            tire:"" , pedal:"" , valve:"" , accessory:"" , maker_url:"" ,
#                            shop_url:"" , picture: ,
#                            price: , gear: , fork:"" , size_list: [] , weight_list: [],frame_name:"",
#                            fork_type:"", kc_or_cb:"", component:""height_list:[[],[]],sex:,road_bike_type:}

#ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
# 1 maker_nameはずべて大文字で統一
# 2 カラーは全て小文字でカタカナも英語化、謎の名前は見た目で判断（メインんカラーのみロゴやワンポイントは無視）
# 3 コンポはそれぞれ、番号を持たせることにする[SRAM[S-Series,1],[SRAM Apex,2],[SRAM Apex 1, 3],[SRAM Rival,4][SRAM Rival 1,5][SRAM Force, 6],[SRAM Force 1,7],[SRAM RED,8],[SRAM RED eTAP, 9]]
#[SHIMANO[DURA-ACE, 10][ULTEGRA, 11][105,12][TIAGRA,13][SORA, 14][CLARIS,14],[DURA-ACE DI2,15][ULTEGRA DI2,16]]
#[CAMPAGNOLO ,[SuperRecord EPS,17],[SuperRecord, 18][Record EPS,19][Record,20],[Chorus EPS,21],[Chorus,22],[Athena,23],[Potenza 24],[Veloce,25]]
#
#４　バイクタイプは{１ロードバイク,2マウンテン、３クロス、４ピスト、５ミニベロ、６シティサイクル、７折りたたみ、８電動アシスト}
#５　ロードバイクタイプ{１ロングライド、２エンデュランス、３エアロバイク（トライアスロン）、４シクロクロス}
#６　sexはfalseが男性、trueが女性
#7　フレームタイプ{1カーボン２アルミ３クロモリ}
#--------------------------------------------------テストデータ用ーーーーーーーーーーーーーーーーーーーーーーーー
all_bike_info_hash_list =[]
 ride3000_bike_info_hash = {maker_name:"MERIDA", year:2017, bike_series: "Ride",bike_name:"Ride3000",
                            frame_type: 1, rear_derailleur: "リアだよ",
                            front_derailleur:"フロントだよ",cranc:"クランクだよ",brake:"ブレーキだよ",chain:"チェーンだよ",sprocket:"スプロケだよ",sti_lever:"レバーだよ",
                            bb: "bbだよ", wheel: "FULCRUM/RACING 3", color: "red", saddle: "オリジナル", seat_pillar:"オリジナル", handle: "オリジナル", stem: "オリジナル",
                            tire: "Panareser/ほげ", pedal: "有", valve: "仏式", accessory: "鍵,リフレクター", maker_url: "http://www.merida.jp/lineup/road_bike/ride_3000.html",
                            shop_url: "http://store.shopping.yahoo.co.jp/cycle-garage1/merida-2017-0004.html", picture: "https://trek.scene7.com/is/image/TrekBicycleProducts/1476000_2017_A_1_Madone_Race_Shop_Limited?wid=3000&hei=2454&fmt=jpg&qlt=50,1&op_usm=0,0,0,0&iccEmbed=0&cache=on,on",
                             size_list: [50,55,60] , weight_list: [6.8,6.85,6.9],price: 150000, gear: 22, fork: "FACT carbon fiber, full carbon monocoque, Zertz inserts",
                            frame_name: "merida ride sp", fork_type: "カーボン", kc_or_cb: "クリンチャー", component: 12,height_list:[[150,165],[155,170],[160,175]],sex:false,road_bike_type:1}

  all_bike_info_hash_list << ride3000_bike_info_hash

  defy_adovanced_sl_0_bike_info_hash = {maker_name:"GIANT", year:2017, bike_series: "DEFY",bike_name:"defy_adovanced_sl_0",
                             frame_type: 2,rear_derailleur: "リアだよ",
                             front_derailleur:"フロントだよ",cranc:"クランクだよ",brake:"ブレーキだよ",chain:"チェーンだよ",sprocket:"スプロケだよ",sti_lever:"レバーだよ",
                             bb: "bbだよ", wheel:"FULCRUM/RACING 3",color:"red",saddle:"オリジナル",seat_pillar:"フレーム一体型",handle:	"GIANT CONTACT SLR Carbon 31.8",stem:"GIANT CONTACT SLR",
                             tire: "GIANT GAVIA SLR 700x25C TUBELESS READY",pedal:"無",valve:"仏式",accessory:"RideSense、ベル、チューブレスバルブ、シーラント",maker_url:"http://www.giant.co.jp/giant17/bike_datail.php?p_id=00000029#specifications",
                             shop_url:"hoge",picture:"https://trek.scene7.com/is/image/TrekBicycleProducts/1476000_2017_A_1_Madone_Race_Shop_Limited?wid=3000&hei=2454&fmt=jpg&qlt=50,1&op_usm=0,0,0,0&iccEmbed=0&cache=on,on",
                             size_list: [45,55,65] , weight_list: [7.8,7.85,7.9],price:750000,gear:22,fork:"Advanced SL-Grade Composite，Full Composite OverDrive 2 Column",
                             frame_name: "ジャイアントフレーム", fork_type: "ダイヤモンド", kc_or_cb: "クリンチャー", component: 14,height_list:[[150,160],[155,165],[160,170]],sex:false,road_bike_type:1}

all_bike_info_hash_list << defy_adovanced_sl_0_bike_info_hash

   cacd12_bike_info_hash = {maker_name:"CANNONDEL", year:2017, bike_series: "CAAD",bike_name:"CAAD12",
                              frame_type: 3, rear_derailleur: "リアだよ",
                              front_derailleur:"フロントだよ",cranc:"クランクだよ",brake:"ブレーキだよ",chain:"チェーンだよ",sprocket:"スプロケだよ",sti_lever:"レバーだよ",
                              bb: "bbだよ", wheel: "FULCRUM/RACING 3", color: "red", saddle: "オリジナル", seat_pillar:"オリジナル", handle: "オリジナル", stem: "オリジナル",
                              tire: "Panareser/ほげ", pedal: "有", valve: "仏式", accessory: "ライト", maker_url: "http://www.merida.jp/lineup/road_bike/ride_3000.html",
                              shop_url: "http://store.shopping.yahoo.co.jp/cycle-garage1/merida-2017-0004.html", picture: "https://trek.scene7.com/is/image/TrekBicycleProducts/1476000_2017_A_1_Madone_Race_Shop_Limited?wid=3000&hei=2454&fmt=jpg&qlt=50,1&op_usm=0,0,0,0&iccEmbed=0&cache=on,on",
                               size_list: [50,55,60] , weight_list: [6.8,6.85,6.9],price: 150000, gear: 22, fork: "FACT carbon fiber, full carbon monocoque, Zertz inserts",
                              frame_name: "caadd 12 sp", fork_type: "カーボン", kc_or_cb: "クリンチャー", component: 10,height_list:[[150,165],[155,170],[160,175]],sex:false,road_bike_type:1}

  all_bike_info_hash_list << cacd12_bike_info_hash
  #-----------------------------------------------------テストデータ終了ーーーーーーーーーーーーーーーーーーーーーーー
  #-------------------------------------------------------以下本当のデーターーーーーーーーーーーーーーーーーーーーーーーー


 #  speed_concept_99_bike_info_hash = {maker_name:"TREK", year:2017, bike_series:"Speed Concept" ,bike_name:"Speed Concept 9.9",
 #                              frame_type:"カーボン" ,
 #                              rear_derailleur:"Shimano Dura-Ace Di2" ,
 #                              front_derailleur:"Shimano Dura-Ace Di2, braze-on",cranc:"Shimano Dura-Ace, 53/39 (double)",brake:"",chain:"",sprocket:"Shimano Dura-Ace, 11-25, 11 speed",sti_lever:"Shimano Dura-Ace Di2, bar end control, 11 speed",
 #                              bb:"BB90" , wheel:"Bontrager Aeolus 5 D3 Tubeless Ready" , color:" black", saddle:" Black" , seat_pillar:"Bontrager Speed Concept Race X Lite, OCLV Carbon, +/-15mm offset",
 #                              handle:"Bontrager Speed Concept full foil aero bar, carbon, direct mount" , stem:"Bontrager Speed Concept, direct mount" ,
 #                              tire:"Bontrager R4 Aero, 220tpi, aramid bead, 700x22c" , pedal:"" , valve:"" , accessory:"" , maker_url:"https://www.trekbikes.com/jp/ja_JP/%E3%83%90%E3%82%A4%E3%82%AF/%E3%83%AD%E3%83%BC%E3%83%89%E3%83%90%E3%82%A4%E3%82%AF/%E3%83%88%E3%83%A9%E3%82%A4%E3%82%A2%E3%82%B9%E3%83%AD%E3%83%B3%E3%83%90%E3%82%A4%E3%82%AF/speed-concept/speed-concept-9-9/p/1489000-2017/" ,
 #                              shop_url: "テスト" , picture: "https://trek.scene7.com/is/image/TrekBicycleProducts/1489000_2017_A_1_Speed_Concept_99?wid=3000&hei=2454&fmt=jpg&qlt=50,1&op_usm=0,0,0,0&iccEmbed=0&cache=on,on",
 #                              price:1350000 , gear:22 , fork:"SC full foil carbon, carbon dropout, integrated brake & stem" , size_list: [] , weight_list: [],
 #                              frame_name:"600 Series OCLV Carbon, KVF (Kammtail Virtual Foil) tube shape, BB90 w/Speed Fin, DuoTrap compatible, SC Speed Box compatible, includes SC Draft Box 2",
 #                              fork_type:"カーボン", kc_or_cb:"", component:""}
 # #ブレーキ、チェーン、画像、重量、バルブ、ペダルの有無、付属品,サイズ、コンポーネント（ミックスなのか全部統一なのかなのか）、クリンチャーかチューブラーか、サイズは
 # all_bike_info_hash_list << speed_concept_99_bike_info_hash
 #
 # speed_concept_75_info_hash = {maker_name:"TREK", year:2017, bike_series:"Speed Concept" ,bike_name:"Speed Concept 7.5",
 #                             frame_type:"500 Series OCLV Carbon, KVF (Kammtail Virtual Foil) tube shape, BB90, DuoTrap compatible, SC Draft Box 2 & SC Speed Box compatible" ,
 #                             rear_derailleur:"SRAM Force 22" ,front_derailleur:"SRAM Force 22 Yaw, braze-on",cranc:"SRAM Quarq Power Ready, 52/36 (semi-compact)",
 #                             brake:"",chain:"",sprocket:"SRAM PG-1170, 11-28, 11 speed",sti_lever:"SRAM 1190 R2C, bar end, 11 speed",
 #                             bb:"BB90" , wheel:"Bontrager Race Tubeless Ready" , color:"grey", saddle:"Bontrager Hilo RXL, hollow titanium rails" , seat_pillar:"Bontrager Speed Concept Race Lite, Alloy, +/-20mm offset",
 #                             handle:"Bontrager Speed Concept KVF aero bar, carbon, direct mount, UCI legal" , stem:"Bontrager Speed Concept, direct mount" ,
 #                             tire:"Bontrager R3 Hard-Case Lite, 700x23c" , pedal:"" , valve:"" , accessory:"" , maker_url:"https://www.trekbikes.com/jp/ja_JP/%E3%83%90%E3%82%A4%E3%82%AF/%E3%83%AD%E3%83%BC%E3%83%89%E3%83%90%E3%82%A4%E3%82%AF/%E3%83%88%E3%83%A9%E3%82%A4%E3%82%A2%E3%82%B9%E3%83%AD%E3%83%B3%E3%83%90%E3%82%A4%E3%82%AF/speed-concept/speed-concept-7-5/p/1485000-2017/" ,
 #                             shop_url:"" , picture: "https://trek.scene7.com/is/image/TrekBicycleProducts/1485000_2017_A_1_Speed_Concept_75?wid=3000&hei=2454&fmt=jpg&qlt=50,1&op_usm=0,0,0,0&iccEmbed=0&cache=on,on",
 #                             price:480000 , gear:22 , fork:"SC KVF carbon, integrated brake & stem, UCI legal" , size_list: [] , weight_list: []}
 #                             #ブレーキ、チェーン、画像、重量、バルブ、ペダルの有無、付属品,サイズ、コンポーネント（ミックスなのか全部統一なのかなのか）、クリンチャーかチューブラーか、
 # all_bike_info_hash_list << speed_concept_75_info_hash
 #
 #  speed_Concept_70_bike_info_hash = {maker_name:"TREK", year:2017, bike_series:"Speed Concept" ,bike_name:"Speed Concept 7.0",
 #                             frame_type:"カーボン" ,
 #                         rear_derailleur:"Shimano 105" ,
 #                         front_derailleur:"Shimano 105, braze-on",cranc:"Shimano RS500, 50/34 (compact)",brake:"",chain:"",sprocket:"Shimano 105, 11-28, 11 speed",
 #                         sti_lever:"Shimano Dura-Ace, bar end control, 11 speed",bb:"BB90" , wheel:"Alloy hubs; Bontrager Tubeless Ready rims" ,
 #                         color:"grey", saddle:"Vision AeroMax Tri" , seat_pillar:"Bontrager Speed Concept Race Lite, Alloy, +/-20mm offset",
 #                         handle:"Bontrager Race Bullhorn w/Race Lite clip-on" , stem:"Bontrager Elite, 31.8mm, 7 degree, w/computer & light mounts" ,
 #                         tire:"Bontrager R1 Hard-Case Lite, 700x23c" , pedal:"" , valve:"" , accessory:"" , maker_url:"https://www.trekbikes.com/jp/ja_JP/%E3%83%90%E3%82%A4%E3%82%AF/%E3%83%AD%E3%83%BC%E3%83%89%E3%83%90%E3%82%A4%E3%82%AF/%E3%83%88%E3%83%A9%E3%82%A4%E3%82%A2%E3%82%B9%E3%83%AD%E3%83%B3%E3%83%90%E3%82%A4%E3%82%AF/speed-concept/speed-concept-7-0/p/1483000-2017/" ,
 #                         shop_url:"" , picture:"https://trek.scene7.com/is/image/TrekBicycleProducts/1483000_2017_A_1_Speed_Concept_70?wid=3000&hei=2454&fmt=jpg&qlt=50,1&op_usm=0,0,0,0&iccEmbed=0&cache=on,on" ,
 #                         price:399000 , gear:22 , fork:"SC full foil carbon, integrated brake & stem" , size_list: [] , weight_list: [],
 #                         frame_name:"500 Series OCLV Carbon, KVF (Kammtail Virtual Foil) tube shape, BB90 w/Speed Fin, DuoTrap compatible, SC Draft Box 2 & SC Speed Box compatible",
 #                         fork_type:"カーボン", kc_or_cb:"", component:""}
 #                         #ブレーキ、チェーン、画像、重量、バルブ、ペダルの有無、付属品,サイズ、コンポーネント（ミックスなのか全部統一なのかなのか）、クリンチャーかチューブラーか、
 #
 # all_bike_info_hash_list << speed_Concept_70_bike_info_hash
 #
 # madone_race_shop_limited_bike_info_hash = {maker_name:"TREK", year:2017, bike_series:"Madone " ,bike_name:"Madone Race Shop Limited",
 #                                             frame_type:"カーボン" ,rear_derailleur:"Shimano Dura-Ace Di2" ,front_derailleur:"Shimano Dura-Ace Di2, braze-on",cranc:"Shimano Dura-Ace, 53/39 (double)",
 #                                             brake:"",chain:"",sprocket:"Shimano Dura-Ace, 11-28, 11 speed",sti_lever:"Shimano Dura-Ace Di2, 11 speed",
 #                                             bb:"BB90" , wheel:"Bontrager Aeolus 5 D3 Tubeless Ready" , color:"red", saddle:"Bontrager Montrose Pro, carbon rails" , seat_pillar:"Madone Micro-adjust carbon seatmast cap, 25mm offset",
 #                                              handle:"Madone XXX Integrated Bar/Stem, KVF profile, invisible cable routing, OCLV Carbon, VR-CF" , stem:"Madone XXX Integrated bar/stem, OCLV Carbon, 7 degree, aero top cap pocket, w/computer & light mounts" ,
 #                                             tire:"Bontrager R4 Hard-Case Lite, 220tpi, aramid bead, 700x25c" , pedal:"" , valve:"" , accessory:"" , maker_url:"https://www.trekbikes.com/jp/ja_JP/%E3%83%90%E3%82%A4%E3%82%AF/%E3%83%AD%E3%83%BC%E3%83%89%E3%83%90%E3%82%A4%E3%82%AF/%E3%83%91%E3%83%95%E3%82%A9%E3%83%BC%E3%83%9E%E3%83%B3%E3%82%B9%E3%83%AD%E3%83%BC%E3%83%89/madone/madone-race-shop-limited/p/1476000-2017/" ,
 #                                             shop_url:"" , picture:"https://trek.scene7.com/is/image/TrekBicycleProducts/1476000_2017_A_1_Madone_Race_Shop_Limited?wid=3000&hei=2454&fmt=jpg&qlt=50,1&op_usm=0,0,0,0&iccEmbed=0&cache=on,on" ,
 #                                             price:1345000 , gear:22 , fork:"Madone KVF full carbon, carbon E2 tapered steerer, carbon dropouts, integrated brake and stem" , size_list: [50,52,54,56,58,60] , weight_list: [],
 #                                             fork_type:"カーボン",frame_name:"700 Series OCLV Carbon, KVF (Kammtail Virtual Foil) tube shape, Madone IsoSpeed, Micro-adjust seatmast, E2 tapered head tube, BB90, invisible cable routing, control center, precision water bottle placement, Aero 3S chain keeper, DuoTrap S compatible",
 #                                            kc_or_cb:"", component:""}
 #
 # all_bike_info_hash_list << madone_race_shop_limited_bike_info_hash



  all_bike_info_hash_list.each do |bike_info_hash|

 Bike.creating_maker_and_all_size_bike_need_argument_is(bike_info_hash[:maker_name], bike_info_hash[:year], bike_info_hash[:bike_series],
                                                        bike_info_hash[:bike_name], bike_info_hash[:frame_type],bike_info_hash[:rear_derailleur],
                                                        bike_info_hash[:front_derailleur],bike_info_hash[:cranc], bike_info_hash[:brake],
                                                        bike_info_hash[:chain], bike_info_hash[:sprocket],bike_info_hash[:sti_lever],
                                                        bike_info_hash[:bb],bike_info_hash[:wheel],bike_info_hash[:color],
                                                        bike_info_hash[:saddle],bike_info_hash[:seat_pillar],bike_info_hash[:handle],
                                                        bike_info_hash[:stem], bike_info_hash[:tire], bike_info_hash[:pedal],
                                                        bike_info_hash[:valve],bike_info_hash[:accessory],bike_info_hash[:maker_url],
                                                        bike_info_hash[:shop_url],bike_info_hash[:picture], bike_info_hash[:size_list],bike_info_hash[:weight_list],
                                                        bike_info_hash[:price], bike_info_hash[:gear], bike_info_hash[:fork],bike_info_hash[:frame_name],
                                                        bike_info_hash[:fork_type], bike_info_hash[:kc_or_cb],bike_info_hash[:component],bike_info_hash[:height_list],bike_info_hash[:sex],bike_info_hash[:road_bike_type])
  end

#-------------------------------------------------------本当のデータ終了ーーーーーーーーーーーーーーーーーーーーーーーー
