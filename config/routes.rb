Rails.application.routes.draw do
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end

  devise_for :users, controllers: { registrations: "registrations" }

  devise_scope :admin do
    get 'admin/users/new', to: 'devise/registrations#new', as: "new_admin_user_registration"
  end
  root to: "dashboards#index"

  resources :users, only: [:index, :show] do
    resources :projects

  end

   namespace :admins do
        resources :cohorts
end
  resources :dashboards, only: [:index] do
    collection do
      post :search, to: 'dashboards#search'
    end
  end



  resources :features
  resources :friendships, only: [:show, :create, :destroy]
  resources :messages, only: [:create]

  mount ActionCable.server => '/cable'


end
