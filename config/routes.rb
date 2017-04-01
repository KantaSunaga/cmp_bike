Rails.application.routes.draw do
  post 'this_is_for_intermediate_or_advanced/home' => 'this_is_for_intermediate_or_advanced#cmp_result'
  get "/this_is_for_beginner/result"
  get "/this_is_for_beginner/home"
  post "/this_is_for_beginner/result"
  get 'this_is_for_intermediate_or_advanced/result'
  get 'home/top' => 'home#top'

  get 'this_is_for_intermediate_or_advanced/home' => 'this_is_for_intermediate_or_advanced#home'

  get 'this_is_for_intermediate_or_advanced/home'
  #Ajax
  get 'this_is_for_intermediate_or_advanced/get_bike_name'
  get 'this_is_for_intermediate_or_advanced/get_bike_name_1'
  get 'this_is_for_intermediate_or_advanced/get_bike_name_2'
  get 'this_is_for_intermediate_or_advanced/get_bike_name_3'
  #Ajax-end
  resources :bikes
  resources :makers
  resources :sizes
  resources :sizes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
