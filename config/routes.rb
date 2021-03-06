Rails.application.routes.draw do
  mount Knock::Engine => "/knock"
  
  #THIS IS FOR LABORATION1
    root 'sessions#login'
  
  get "apps" => "apps#new"
  get "deleteapp" => "apps#delete_application"
    
  get "home" => "sessions#home"
  get "signup" => "users#new"
  get "login" => "sessions#login"
  get "logout" => "sessions#logout"
  get "profile" => "sessions#profile"

  
  get ':controller(/:action(/:id))(.:format)'
  post ':controller(/:action(/:id))(.:format)'
  
  
  #THIS IS FOR LABORATION2
  
  #Add /api/ before URI
namespace :api, :defaults => { :format => :json} do
    namespace :v1 do
        get "/restaurants" => "restaurants#index"
        post "/restaurants" => "restaurants#create"
        
        get "/restaurants/:id" => "restaurants#show"
        put "/restaurants/:id" => "restaurants#update"
        delete "/restaurants/:id" =>"restaurants#destroy"
        
        resources :positions
        get "/positions/nearby/:long/:lat" => "positions#nearby"
        resources :tags
    end
end

#Callback from omniauth
get "/auth/github/callback" => "sessions#create"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
end
