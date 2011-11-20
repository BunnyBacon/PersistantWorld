PersistantWorld::Application.routes.draw do
  

  get "shared/homepage"

  # /***** Pathing *****/

  # Forum Related Paths
  get 'topics/:thread/:page' => 'topics#show', as: 'show_topic'
  get 'new-topic' => 'topics#new', as: 'new_topic'

  # /***** Resoources ******/
  resources :posts
  resources :topics
  
  # Login related
  resource :user_session
  resource :account, :controller => 'users'
  resources :users
  get 'new-fancy' => 'users#new_fancy', as: 'new_fancy'


  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'shared#homepage'
end
