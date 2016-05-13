Rails.application.routes.draw do

  get 'lessons/index'

  get 'lessons/show'

  root 'static_pages#home'

  resources :topics, only: [:index, :show, :new, :create]

  resources :lessons, only: [:index, :show]

end