PersistantWorld::Application.routes.draw do
  

  # /***** Resoources ******/
  resources :posts
  # Login related stuff
  resource :user_session
  resource :account, :controller => 'users'
  resources :users


  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
end
