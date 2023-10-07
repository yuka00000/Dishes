Rails.application.routes.draw do
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 飲食店用
  # URL /restaurant_info/sign_in ...
  devise_for :restaurants, path: 'restaurant_info',  module: 'devise', skip: [:passwords], controllers: {
    registrations: "restaurant_info/registrations",
    sessions: 'restaurant_info/sessions'
  }
  #devise_for :restaurant_infos

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
    resources :users, only: [:edit, :update]
  end

  devise_scope :restaurant_info do
    get 'restaurant_info/sign_up' => 'devise/registrations#new', as: :new_restaurant_info_registration
    post 'restaurant_info/signup' => 'devise/registrations#create', as: :restaurant_info_registration
    post 'restaurant_info/log_in' => 'devise/sessions#create', as: :restaurant_info_session
    delete 'restaurant_info/log_out' => 'devise/sessions#destroy', as: :destroy_restaurant_inf_session
    resources :restaurant_infos, only: [:show, :edit, :update]
  end

  scope module: :public do
    root to: "homes#top"
    resources :posts
    get '/users/mypage' => 'users#show'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
