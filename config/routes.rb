Rails.application.routes.draw do
  root 'this_is_for_beginner#home'
  #------------管理画面----------------
  get '/admin/login' => "admins#login"
  get '/admin/forget_password_form' => "admins#forget_password_form"
  post '/admin/make_tmp_password' => "admins#make_tmp_password"
  post '/admin/check' => "admins#check"
  get "/admin/index" => "admins#index"
  delete '/admin/logout' => 'admins#logout'
  get 'admin/csv' => 'admins#csv'
  post 'admin/import_csv' => 'admins#import_csv'
  #-----------管理画面end--------------
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
  get "inquiry/confirm" => redirect("/inquiry")
  get "inquiry/thanks" => redirect("/inquiry")
    # --------問い合わせフォーム系endーーーーーーーーーー
  resources :roadbikes
  resources :makers
  resources :sizes
  resources :colors
  resources :mangements
  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
