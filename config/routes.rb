# == Route Map
#
#            Prefix Verb   URI Pattern                       Controller#Action
#         databases GET    /databases(.:format)              databases#index
#                   POST   /databases(.:format)              databases#create
#      new_database GET    /databases/new(.:format)          databases#new
#     edit_database GET    /databases/:id/edit(.:format)     databases#edit
#          database GET    /databases/:id(.:format)          databases#show
#                   PATCH  /databases/:id(.:format)          databases#update
#                   PUT    /databases/:id(.:format)          databases#update
#                   DELETE /databases/:id(.:format)          databases#destroy
#            fields GET    /fields(.:format)                 fields#index
#                   POST   /fields(.:format)                 fields#create
#         new_field GET    /fields/new(.:format)             fields#new
#        edit_field GET    /fields/:id/edit(.:format)        fields#edit
#             field GET    /fields/:id(.:format)             fields#show
#                   PATCH  /fields/:id(.:format)             fields#update
#                   PUT    /fields/:id(.:format)             fields#update
#                   DELETE /fields/:id(.:format)             fields#destroy
#     relationships GET    /relationships(.:format)          relationships#index
#                   POST   /relationships(.:format)          relationships#create
#  new_relationship GET    /relationships/new(.:format)      relationships#new
# edit_relationship GET    /relationships/:id/edit(.:format) relationships#edit
#      relationship GET    /relationships/:id(.:format)      relationships#show
#                   PATCH  /relationships/:id(.:format)      relationships#update
#                   PUT    /relationships/:id(.:format)      relationships#update
#                   DELETE /relationships/:id(.:format)      relationships#destroy
#            tables GET    /tables(.:format)                 tables#index
#                   POST   /tables(.:format)                 tables#create
#         new_table GET    /tables/new(.:format)             tables#new
#        edit_table GET    /tables/:id/edit(.:format)        tables#edit
#             table GET    /tables/:id(.:format)             tables#show
#                   PATCH  /tables/:id(.:format)             tables#update
#                   PUT    /tables/:id(.:format)             tables#update
#                   DELETE /tables/:id(.:format)             tables#destroy
#

Rails.application.routes.draw do
  root :to => 'generator#index'
  get '/generator' => 'generator#index'
  post '/' => 'generator#create'
  resources :databases
  resources :fields
  resources :relationships
  resources :tables


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
