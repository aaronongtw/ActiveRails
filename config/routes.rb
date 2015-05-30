# == Route Map
#
#            Prefix Verb   URI Pattern                       Controller#Action
#             users GET    /users(.:format)                  users#index
#         users_new GET    /users/new(.:format)              users#new
#        users_edit GET    /users/edit(.:format)             users#edit
#      users_create GET    /users/create(.:format)           users#create
#        users_show GET    /users/show(.:format)             users#show
#     users_destroy GET    /users/destroy(.:format)          users#destroy
#      users_update GET    /users/update(.:format)           users#update
#              root GET    /                                 generator#index
#         generator GET    /generator(.:format)              generator#index
#                   POST   /                                 generator#create
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

  get 'users/' => 'users#index'

  get 'users/new'

  get 'users/edit'

  get 'users/create'

  get 'users/show'

  get 'users/destroy'

  get 'users/update'

  root :to => 'generator#index'
  get '/generator' => 'generator#index'
  post '/' => 'generator#create'
  resources :databases
  resources :fields
  resources :relationships
  resources :tables

end
