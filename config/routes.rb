Rails.application.routes.draw do
  resources :communities do
    resources :members
    member do
      get :join
    end
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    # Twitter API認証用
    :omniauth_callbacks => 'users/omniauth_callbacks',
  }
  resources :users

  resources :user_strengths
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "users#index"

  # 静的ページ
  get 'static_pages/info'
  get 'static_pages/terms'
  get 'static_pages/privacy'
  get 'static_pages/faq'
end
