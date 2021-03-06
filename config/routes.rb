Rails.application.routes.draw do
  namespace :v1 do
    mount_devise_token_auth_for "User", at: "auth", controllers: {
      registrations: 'v1/auth/registrations'
  }
  end
  resources :users, only: [:index]
  resources :rooms, only: [:index, :create, :destroy] do
    resources :schedules, only: [:index, :create, :destroy]
  end
end