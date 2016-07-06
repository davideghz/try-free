Rails.application.routes.draw do

  get 'user_lessons/create'

  get 'user_lessons/destroy'

  get 'filters/show'

  scope "(:locale)" do
    root 'static_pages#home'

    resources :lesson_details, only: [:show]
    resources :user_lessons, only: [:create, :destroy]

    resources :topics, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :lessons, only: [:index, :show, :new, :create]
    end

    devise_for :users

    devise_scope :users do
      resources :profiles, except: [:index]
    end
  end


end
