Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :admin do
    #get 'staff/users/new' => 'devise/sessions#new' #as: "new_user_registration"
    #get "/staff/sign_in" => "devise/registrations#new" do#as: "new_user_registration"do
    #delete 'staff/tap_out' => "devise/sessions#destroy", :to => 'destroy_user_session_path'
    end
    devise_scope :user do
      get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
      get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
      delete "/tap_out" => "devise/sessions#destroy", as: "destroy_user_session_path"
    end


  root to: "dashboards#index"

  resources :cohorts, only: [:index, :show] do
  resources :users, only: [:index, :show] do
    resources :projects
    end
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
