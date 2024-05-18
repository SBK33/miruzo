Rails.application.routes.draw do
  devise_for :users
  scope module: :public do
    root to: "homes#top"
    get 'homes/about'

    resources :posts, only: [:new, :index, :show, :create, :edit, :update, :destroy]
    #↑onlyにしなくてよい可能性あり。要確認。

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
