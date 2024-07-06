Rails.application.routes.draw do
#管理者用ルーティング
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
  end
  
#ユーザー用ルーティング
  devise_for :users
  scope module: :public do
    root to: "homes#top"
#    get 'homes/about' => "homes#about", as: "about"

    resources :posts, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
    end

    #↑onlyにしなくてよい可能性あり。要確認。
    resources :users, only: [:show, :edit, :update]

    #検索用ルーティング
    get "search" => "searches#search"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
