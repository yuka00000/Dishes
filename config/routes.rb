Rails.application.routes.draw do
  # 顧客用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
    resources :users, only: [:edit, :update]
  end

  # 飲食店用
  devise_for :restaurants, path: 'restaurant_info', controllers: {
    registrations: "restaurant_info/registrations",
    sessions: 'restaurant_info/sessions'
  }

  #namespace :restaurant_info do
    # devise_scope :restaurant do
      # get 'restaurant_info/sign_up' => 'restaurant_info/registrations#new', as: :new_restaurant_info_registration
      # post 'restaurant_info/sign_up' => 'restaurant_info/registrations#create', as: :restaurant_info_registration
      # get 'restaurant_info/sign_in' => 'restaurant_info/sessions#new', as: :restaurant_info_session
      # post 'restaurant_info/sign_in' => 'restaurant_info/sessions#create'
      # delete 'restaurant_info/sign_out' => 'restaurant_info/sessions#destroy', as: :destroy_restaurant_info_session

      # namespace :restaurant do
      #   get 'top' => 'homes#top'
      #   get 'restaurant/mypage' => 'restaurants#show'
      #   resources :restaurant, only: [:show, :edit, :update]
      # end
    # end
  #end

  namespace :restaurant_info do
    get 'top' => 'homes#top'
    get 'restaurant/mypage' => 'restaurants#show'
    resources :restaurant, only: [:show, :edit, :update]
  end

  scope module: :public do
    root to: "homes#top"
    resources :posts
    get '/users/mypage' => 'users#show'
    resources :users, only: [:show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
