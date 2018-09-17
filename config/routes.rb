Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    resources :cohorts
      resources :attendances

  devise_for :users#, :only => :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } 
  resources :users do
    resources :projects, controller: 'users/projects'
    collection do
      get 'search'
      end
  end


      devise_scope :user do
          #get 'sign_in', to: 'devise/sessions#new'
          # post '/users/sign_in', to: 'devise/sessions#create'
          #get  '/users/sign_out', to: 'devise/sessions#destroy'
          get '/user_google_oauth2_omniauth_authorize_path', to: 'events#calendars', as: 'calendars'
          get '/redirect', to: 'events#redirect', as: 'redirect'
          get '/callback', to: 'events#callback', as: 'callback'
          get "/admin/logout",to: 'active_admin/devise/sessions#destroy', via: 'destroy'
          post 'admin/logout', to: 'classrooms#index'
          get '/events/:calendar_id', to: 'events#events', as: 'event', calendar_id: /[^\/]+/
          post '/events/:calendar_id', to: 'events#new_event', as: 'new_event', calendar_id: /[^\/]+/
          # get '/users/:id', to: 'devise/sessions#new', as: 'tap_in'
          # post 'tap_in', to: 'classrooms#index', as: 'redirect'
          #get 'users/:id', to: 'users#show'
          get 'genius_signup', to: 'devise/registrations#new'
          post 'genius_signup', to: 'classrooms#index'
          # get 'auth/google_oauth2/callback', to: 'users#create', as: 'google_signin'
          # get 'signout', to: 'devise/sessions#destroy', via: 'destroy'
          # #get "tap_out",  destroy_user_/users/:idsession_path
          # post 'signout', to: 'classrooms#index'
          #delete 'delete'users/:id => 'users#destroy',
      #end
    end
  # scope :api do
  #   scope :v1 do
  #     #resources :<controller_name>, except: [:new, :edit]
  #     get 'api/v1/users' , to: 'registrations#create' , via: :post
  #   end
  # end



# # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



      resources :features,only: [:create]
      resources :friendships, only: [:show, :create, :destroy]
      resources :messages, only: [:create]
      resources :classrooms


      root to: "classrooms#index"
    mount ActionCable.server => '/cable'

    #end
  end
