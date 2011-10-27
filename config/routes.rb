PersistantWorld::Application.routes.draw do
  

  # /***** Pathing *****/

  # Forum Related Paths
  get 'topics/:thread/:page' => 'topics#show', as: 'show_topic'
  get 'new-topic' => 'topics#new', as: 'new_topic'

  # /***** Resoources ******/
  resources :posts
  resources :topics
  # Login related stuff
  resource :user_session
  resource :account, :controller => 'users'
  resources :users


  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
end
