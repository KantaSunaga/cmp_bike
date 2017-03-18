# This file should contain  all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#これに自転車のサイズ、重量以外のデータを入れるーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
# 〜〜＿bike_basick_bike_hash = {"maker_id" => , "bike_series"=>,"bike_name"=>,"frame_type"=>,"rear_derailleur"=>,
#                           "front_derailleur"=>,"crank"=>,"brake"=>,"chain"=>,"sprocket"=>,"sti_lever"=>,"bb"=>,"wheel"=>,"color"=>,
#                           "saddle"=>,"seat_pillar"=>,"handle"=>,"stem"=>,"tire"=>,"pedal"=>,"valve"=>,"accessory"=>,"maker_url"=>,
#                           "shop_url"=>,"picture"=>,"size"=>,"weight"=>,"price"=>,"gear"=>,"fork"=>}
#ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

#これにサイズを入れるーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
#~_bike_size_list = []
#ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

#ーーーーーーーーーーーーーーーーーこれに重量を入れるーーーーーーーーーーーーーーーーーーー
#~_bike_weight_list = []
#ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
#--------------------------------------------------テストデータ用ーーーーーーーーーーーーーーーーーーーーーーーー

all_bike_info_hash_list =[]
 ride3000_bike_info_hash = {maker_name:"merida", year:2017, bike_series: "Ride",bike_name:"Ride3000",
                            frame_type: "カーボン", rear_derailleur: "リアだよ",
                            front_derailleur:"フロントだよ",cranc:"クランクだよ",brake:"ブレーキだよ",chain:"チェーンだよ",sprocket:"スプロケだよ",sti_lever:"レバーだよ",
                            bb: "bbだよ", wheel: "FULCRUM/RACING 3", color: "red", saddle: "オリジナル", seat_pillar:"オリジナル", handle: "オリジナル", stem: "オリジナル",
                            tire: "Panareser/ほげ", pedal: "有", valve: "仏式", accessory: "鍵,リフレクター", maker_url: "http://www.merida.jp/lineup/road_bike/ride_3000.html",
                            shop_url: "http://store.shopping.yahoo.co.jp/cycle-garage1/merida-2017-0004.html", picture: nil,
                            price: 150000, gear: 22, fork: "FACT carbon fiber, full carbon monocoque, Zertz inserts", size_list: [50,55,60] , weight_list: [6.8,6.85,6.9]}
                            # maker_name, year, bike_series, bike_name, frame_type, rear_derailleur, front_derailleur,
                            #      crank, brake, chain, sprocket, sti_lever, bb, wheel, color,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,
                            #      maker_url, shop_url, picture, size_list, weight_list, price, gear, fork

  all_bike_info_hash_list << ride3000_bike_info_hash

  defy_adovanced_sl_0_bike_info_hash = {maker_name:"GIANT", year:2017, bike_series: "DEFY",bike_name:"defy_adovanced_sl_0",
                             frame_type:"カーボン",rear_derailleur: "リアだよ",
                             front_derailleur:"フロントだよ",cranc:"クランクだよ",brake:"ブレーキだよ",chain:"チェーンだよ",sprocket:"スプロケだよ",sti_lever:"レバーだよ",
                             bb: "bbだよ", wheel:"FULCRUM/RACING 3",color:"red",saddle:"オリジナル",seat_pillar:"フレーム一体型",handle:	"GIANT CONTACT SLR Carbon 31.8",stem:"GIANT CONTACT SLR",
                             tire: "GIANT GAVIA SLR 700x25C TUBELESS READY",pedal:"無",valve:"仏式",accessory:"RideSense、ベル、チューブレスバルブ、シーラント",maker_url:"http://www.giant.co.jp/giant17/bike_datail.php?p_id=00000029#specifications",
                             shop_url:"hoge",picture:nil,price:750000,gear:22,fork:"Advanced SL-Grade Composite，Full Composite OverDrive 2 Column",size_list: [45,55,65] , weight_list: [7.8,7.85,7.9]}

  all_bike_info_hash_list <<   defy_adovanced_sl_0_bike_info_hash

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
                                                        bike_info_hash[:price], bike_info_hash[:gear], bike_info_hash[:fork])
  end
  # maker_name, year, bike_series, bike_name, frame_type, rear_derailleur, front_derailleur,
  #      crank, brake, chain, sprocket, sti_lever, bb, wheel, color,saddle, seat_pillar, handle, stem, tire, pedal, valve, accessory,
  #      maker_url, shop_url, picture, size_list, weight_list, price, gear, fork

  # Bike.creating_maker_and_all_size_bike_need_argument_is("GIANT", 2017, "DEFY", "DEFY ADVANCED SL 0", "カーボン",
  #     "SRAM RED eTap 電動", "SRAM RED eTap 電動 直付用", 	"SRAM RED 34/50T", "SRAM RED eTap HRD 140mm", "	SRAM RED22 11S", 	"SRAM XG1190 11S 11-28T",
  #     "SRAM RED eTap HRD 電動", "SRAM GXP Press Fit (BB86)", "	GIANT SLR0 DISC Carbon WheelSystem 12mm Axle", "COLOR : カーボン","	GIANT CONTACT SLR NEUTRAL Carbon Rail",
  #      "フレーム一体型", "GIANT CONTACT SLR", "GIANT CONTACT SLR OD2", "GIANT GAVIA SLR 700x25C TUBELESS READY", "なし", "仏式", "RideSense、ベル、チューブレスバルブ、シーラント",
  #     "http://www.giant.co.jp/giant17/bike_datail.php?p_id=00000029#specifications", nil, nil, [71,74,77], [6.95,7.0,7.05], 750000, 22, "Advanced SL-Grade Composite，Full Composite OverDrive 2 Column")

 # defy_adovanced_sl_0_bike_basick_bike_hash = {maker_name:"GIANT", year:2017, bike_series: "DEFY",bike_name:"defy_adovanced_sl_0",
 #                            frame_type:"カーボン",rear_derailleur:"SRAM RED eTap 電動",
 #                            front_derailleur:"SRAM RED eTap 電動 直付用",cranc:"SRAM RED 34/50T",brake:"SRAM RED eTap HRD 140mm",chain:"	SRAM RED22 11S",sprocket:"SRAM XG1190 11S 11-28T",
 #                            sti_lever:"SRAM RED eTap HRD 電動",
 #                            bb:"SRAM GXP Press Fit (BB86)", wheel:"FULCRUM/RACING 3",color:"red",saddle:"オリジナル",seat_pillar:"フレーム一体型",handle:	"GIANT CONTACT SLR Carbon 31.8",stem:"GIANT CONTACT SLR",
 #                            tire: "GIANT GAVIA SLR 700x25C TUBELESS READY",pedal:"無",valve:"仏式",accessory:"RideSense、ベル、チューブレスバルブ、シーラント",maker_url:"http://www.giant.co.jp/giant17/bike_datail.php?p_id=00000029#specifications",
 #                            shop_url:nil,picture:nil,price:750000,gear:22,fork:"Advanced SL-Grade Composite，Full Composite OverDrive 2 Column"}
 #
 # defy_adovanced_sl_0_bike_size_list = [50,55,60]
 # defy_adovanced_sl_0_bike_weight_list = [6.8,6.85,6.9]
 #
 # Bike.creating_maker_and_all_size_bike_need_argument_is(defy_adovanced_sl_0[:maker_name], defy_adovanced_sl_0_bike_basick_bike_hash[:year], defy_adovanced_sl_0_bike_basick_bike_hash[:bike_series],
 #                                                        defy_adovanced_sl_0_bike_basick_bike_hash[:bike_name], defy_adovanced_sl_0_bike_basick_bike_hash[:frame_type],defy_adovanced_sl_0_bike_basick_bike_hash[rear_derailleur:],
 #                                                        defy_adovanced_sl_0_bike_basick_bike_hash[:front_derailleur],defy_adovanced_sl_0_bike_basick_bike_hash[cranc:], defy_adovanced_sl_0_bike_basick_bike_hash[:brake],
 #                                                        defy_adovanced_sl_0_bike_basick_bike_hash[:chain], defy_adovanced_sl_0_bike_basick_bike_hash[:sprocket:"105"],defy_adovanced_sl_0_bike_basick_bike_hash[:sti_lever],
 #                                                        defy_adovanced_sl_0_bike_basick_bike_hash[:bb],defy_adovanced_sl_0_bike_basick_bike_hash[:wheel],defy_adovanced_sl_0_bike_basick_bike_hash[:color],
 #                                                        defy_adovanced_sl_0_bike_basick_bike_hash[:saddle],defy_adovanced_sl_0_bike_basick_bike_hash[:seat_pillar],defy_adovanced_sl_0_bike_basick_bike_hash[:handle],
 #                                                        defy_adovanced_sl_0_bike_basick_bike_hash[:stem], defy_adovanced_sl_0_bike_basick_bike_hash[:tire], defy_adovanced_sl_0_bike_basick_bike_hash[:pedal],
 #                                                        defy_adovanced_sl_0_bike_basick_bike_hash[:valve],defy_adovanced_sl_0_bike_basick_bike_hash[:accessory],defy_adovanced_sl_0_bike_basick_bike_hash[:maker_url],
 #                                                        defy_adovanced_sl_0_bike_basick_bike_hash[:shop_url],defy_adovanced_sl_0_bike_basick_bike_hash[:picture], defy_adovanced_sl_0_bike_size_list,defy_adovanced_sl_0_bike_weight_list,
 #                                                        defy_adovanced_sl_0_bike_basick_bike_hash[:price], defy_adovanced_sl_0_bike_basick_bike_hash[:gear], defy_adovanced_sl_0_bike_basick_bike_hash[:fork])
 #
#-----------------------------------------------------テストデータ終了ーーーーーーーーーーーーーーーーーーーーーーー
