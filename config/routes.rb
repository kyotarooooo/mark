Rails.application.routes.draw do
  devise_for :users

  root "homes#top"
  resources :microposts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  	resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
