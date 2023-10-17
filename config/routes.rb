Rails.application.routes.draw do
  # 顧客用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 飲食店用
  devise_for :restaurants, path: 'restaurant_info', controllers: {
    registrations: "restaurant_info/registrations",
    sessions: 'restaurant_info/sessions'
  }

  # 管理者用
  devise_for :admin, skip: [:passwords] ,controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  # 顧客用
  scope module: :public do
    root to: "homes#top"
    get "search" => "searches#search"
    get '/post/hashtag/:name' => 'posts#hashtag'
    get '/post/hashtag' => 'posts#hashtag'
    get '/reservation_complete', to: 'reservations#complete', as: 'reservation_completed'
    resources :users, only: [:show, :edit, :update, :destroy] do
      member do
        get :follows, :followers
      end
      resource :relationships, only: [:create, :destroy]
    end

    resources :restaurants, only: [:show] do
      resources :reservations, only: [:new, :create]
    end
    resources :reservations, only: [:show, :index]
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  end

  # 飲食店用
  namespace :restaurant_info do
    get 'top' => 'homes#top'
    get 'restaurants/mypage' => 'restaurants#show'
    resources :restaurants, only: [:show, :edit, :update, :destroy] do
      resources :reservations, only: [:show, :index]
    end
  end

  # 管理者用
  scope module: :admin do
    get 'admins/top' => 'admins#top', as: 'admins_top'
    get 'admins/users/:id' => 'admins#users', as: 'admins_users'
    get 'admins/restaurants/:id' => 'admins#restaurants', as: 'admins_restaurants'
    resources :admins, only: [:index, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
