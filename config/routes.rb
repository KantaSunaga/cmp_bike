Rails.application.routes.draw do
  get '/admin/index' => "admins#index"
  devise_for :users
  post 'this_is_for_intermediate_or_advanced/home' => 'this_is_for_intermediate_or_advanced#cmp_result'
  get "/this_is_for_beginner/result"
  get "/this_is_for_beginner/home"
  get "/this_is_for_beginner/result/:bike_type/:detail_frame/:detail_frame/:detail_bike_type/:detail_component/:detail_maker/:price_down/:price_up/:color/:sex/:user_size/:brake_type/:sub_color/:sub_color2" => "this_is_for_beginner#result"
  get 'this_is_for_intermediate_or_advanced/result'
  get 'home/top' => 'home#top'
  get 'this_is_for_beginner/detail/:id' =>'this_is_for_beginner#detail'

  get 'this_is_for_intermediate_or_advanced/home' => 'this_is_for_intermediate_or_advanced#home'

  get 'this_is_for_intermediate_or_advanced/home'
  # --------問い合わせフォーム系ーーーーーーーーーー
  get 'inquiry' => 'inquiry#index'
  post 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' => 'inquiry#thanks'     
    # --------問い合わせフォーム系endーーーーーーーーーー
  resources :roadbikes
  resources :makers
  resources :sizes
  resources :colors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
