Rails.application.routes.draw do

  root 'static_pages#home'
  get 'lessons/index'
  get 'lessons/show'

  devise_for :users

  resources :topics, only: [:index, :show, :new, :create]

  resources :lessons, only: [:index, :show]

end
