Rails.application.routes.draw do
  resources :events
  root to: 'pages#home'
  devise_for :users

  namespace :admin do
    resources :users
    root to: 'users#index'
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end
    end
  end
end
