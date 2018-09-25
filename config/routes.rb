Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    resources :cohorts
      resources :attendances

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
      resources :users do
        resources :projects
      end

      devise_scope :user do
          # get 'admin_user/registrations/new', to: 'active_admin/devise/registrations#new'
          # post 'admin_user/registrations/new', to: 'active_admin/devise/registrations#new'
          get "/admin/logout",to: 'active_admin/devise/sessions#destroy', via: 'destroy'
          post 'admin/logout', to: 'classrooms#index'
          get 'genius_signup', to: 'devise/registrations#new'
          post 'genius_signup', to: 'classrooms#index'
          get 'user_google_oauth2_omniauth_authorize_path', to: 'events#calendars', as: 'calendars'
          get '/redirect', to: 'events#redirect', as: 'redirect'
          get '/callback', to: 'events#callback', as: 'callback'

          get '/events/:calendar_id', to: 'events#events', as: 'event', calendar_id: /[^\/]+/
          post '/events/:calendar_id', to: 'events#new_event', as: 'new_event', calendar_id: /[^\/]+/
          get 'tap_in', to: 'devise/sessions#new'
          get 'genius_signup', to: 'devise/registrations#new'
          get 'auth/google_oauth2/callback', to: 'users#create', as: 'google_signin'
          delete 'signout', to: 'sessions#destroy', via: 'destroy'
          post 'signout', to: 'classrooms#index'

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
      resources :friendships, only: [:show, :create, :destroy] do
      resources :messages, only: [:create]
      resources :classrooms
        collection do
        post :search, to: 'classrooms#search'
          end
        end
      root to: "classrooms#index"
    mount ActionCable.server => '/cable'

    #end
  end
