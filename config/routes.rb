Rails.application.routes.draw do

  scope "(:locale)" do
    root 'static_pages#home'
    get 'lessons/index'
    get 'lessons/show'

    resources :topics, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :lessons, only: [:index, :show, :new, :create]
    end

    devise_for :users
  end


end
