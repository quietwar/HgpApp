Rails.application.routes.draw do
  resources :schedules
  resources :locations
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
   #devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
   resources :users, only: [:index, :show] do
     resources :projects, only: [:create, :new, :show]
     end

      devise_scope :user do
        # get '/project/new', to: 'projects#new', as: 'new_user_project'
        # post 'project/new', to: 'projects#create'
        get '/calendars', to: 'schedules#calendars', as: 'calendars'
        get '/redirect', to: 'schedules#redirect', as: 'redirect'
        get '/callback', to: 'schedules#callback', as: 'callback'
        get '/events/:calendar_id', to: 'schedules#events', as: 'events', calendar_id: /[^\/]+/
        get '/events/:calendar_id', to: 'schedules#events', as: 'hgp_event', calendar_id: /[^\/]+/
        post '/events/:calendar_id', to: 'schedules#new_event', as: 'new_event', calendar_id: /[^\/]+/
        get 'tap_in', to: 'devise/sessions#new'
        get 'genius_signup', to: 'devise/registrations#new'
        get 'auth/google_oauth2/callback', to: 'users#create', as: 'google_signin'
        get 'signout', to: 'users/sessions#destroy', as: 'signout'
      end

  

# # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


      resources :features,only: [:create]
      resources :cohorts, only: [:index, :show]
      resources :classrooms, only: [:index, :show, :search] do
        collection do
          post :search, to: 'classrooms#search'
        end
      end

      resources :friendships, only: [:show, :create, :destroy] do
      resources :messages, only: [:create]
        end
      #get "/auth/:provider/callback" => "authentications#create"
      root to: "classrooms#index"
    mount ActionCable.server => '/cable'

    #end
  end
