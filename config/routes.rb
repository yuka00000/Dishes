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

  namespace :restaurant_info do
    get 'top' => 'homes#top'
    get 'restaurants/mypage' => 'restaurants#show'
    resources :restaurants, only: [:show, :edit, :update]
  end

  scope module: :public do
    root to: "homes#top"
    get "search" => "searches#search"
    get '/post/hashtag/:name' => 'posts#hashtag'
    get '/post/hashtag' => 'posts#hashtag'
    resources :users, only: [:show, :edit, :update] do
      member do
        get :follows, :followers
      end
        resource :relationships, only: [:create, :destroy]
    end

    resources :restaurants, only: [:show]
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
