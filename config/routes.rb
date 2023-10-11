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
    resources :users, only: [:show, :edit, :update]
    resources :restaurants, only: [:show]
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
