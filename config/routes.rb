PersistantWorld::Application.routes.draw do
  
  # Irwi path
  wiki_root '/wiki'

  get "shared/homepage"

  # /***** Pathing *****/

  # Forum Related Paths
  resources :forums do
    resources :topics 
  end
  resources :topics do
    resources :posts
  end
  resources :users do
    resources :uploads
  end

  get 'subscribe-to-topic/:id' => 'topics#subscribe', as: 'subscribe'
  get 'confirm-subscription/:id' => 'topics#confirm_sub', as: 'confirm_sub'
  
  # Login related
  resource :user_session
  resource :account, :controller => 'users'
  resources :users
  resources :profiles
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  get 'new-fancy' => 'users#new_fancy', as: 'new_fancy'
  get 'edit-profile' => 'profiles#edit', as: 'edit_profile'
  get 'show-profile' => 'profiles#show', as: 'show_profile'



  # Homepage
  root :to => 'shared#homepage'
end
