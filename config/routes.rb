App::Application.routes.draw do
   # get "sessions/new"
   # get "users/new"
root :to => "welcome#index"
get '/auth/:provider/callback', :to =>"sessions#create"
get 'auth/failure', to: redirect('/')
get "/signout" => "sessions#destroy", :as=>:signout

 #get "welcome/index"

  get "log_in" => "sessions#new", :as => "log_in"
  post "log_in_user" => "sessions#create", :as => "log_in_user"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  post "sign_up_user" => "users#create", :as => "sign_up_user"

 
  resources :users
  resources :sessions
  resources :articles 
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    
end



# get '/auth/:provider/callback', to: 'sessions#create'
#   get 'auth/failure', to: redirect('/')


   
#   get "log_in" => "sessions#new", :as => "log_in"
#   post "log_in_user" => "sessions#create", :as => "log_in_user"
#   delete "log_out" => "sessions#destroy", :as => "log_out"
#   get "sign_up" => "users#new", :as => "sign_up"
#   post "sign_up_user" => "users#create", :as => "sign_up_user"








  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

