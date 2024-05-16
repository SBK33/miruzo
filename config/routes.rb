Rails.application.routes.draw do
  devise_for :users
  scope module: :public do
    root to: "homes#top"
    get 'homes/about'
    
    
    get 'posts/index'
    get 'posts/show'
    get 'posts/new'
    get 'posts/create'
    get 'posts/edit'
    get 'posts/update'
    get 'posts/destroy'
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
