FactoryGirl.define do
  factory :this_is_for_beginer_controller, class: Roadbike do
    bike_type "1"
    detail_check_box nil
    detail_maker nil
    detail_frame nil
    detail_bike_type nil
    detail_component nil
    brake_type nil
    price_down "0"
    price_up "10000000"
    color "red"
    sex "men"
    user_size "165"
  end
end
