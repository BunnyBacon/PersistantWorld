PersistantWorld::Application.routes.draw do
  

  wiki_root '/wiki'

  get "shared/homepage"

  # /***** Pathing *****/

  # Forum Related Paths
  get 'topics/:thread/:page' => 'topics#show', as: 'show_topic'
  get 'new-topic' => 'topics#new', as: 'new_topic'
  get 'profile/edit' => 'profiles#edit', as: 'edit_profile'

  # /***** Resoources ******/
  resources :posts
  resources :topics
  
  # Login related
  resource :user_session
  resource :account, :controller => 'users'
  resources :users
  resources :profiles
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  get 'new-fancy' => 'users#new_fancy', as: 'new_fancy'
  get 'edit-profile' => 'profiles#edit', as: 'edit_profile'


  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'shared#homepage'
end
