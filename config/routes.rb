# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                           session_new GET    /session/new(.:format)                                                                   session#new
#                                 login POST   /login(.:format)                                                                         session#create
#                                       DELETE /login(.:format)                                                                         session#destroy
#                                       GET    /login(.:format)                                                                         session#new
#                            edit_users GET    /users/edit(.:format)                                                                    users#edit
#     user_database_table_relationships GET    /users/:user_id/databases/:database_id/tables/:table_id/relationships(.:format)          relationships#index
#                                       POST   /users/:user_id/databases/:database_id/tables/:table_id/relationships(.:format)          relationships#create
#  new_user_database_table_relationship GET    /users/:user_id/databases/:database_id/tables/:table_id/relationships/new(.:format)      relationships#new
# edit_user_database_table_relationship GET    /users/:user_id/databases/:database_id/tables/:table_id/relationships/:id/edit(.:format) relationships#edit
#      user_database_table_relationship GET    /users/:user_id/databases/:database_id/tables/:table_id/relationships/:id(.:format)      relationships#show
#                                       PATCH  /users/:user_id/databases/:database_id/tables/:table_id/relationships/:id(.:format)      relationships#update
#                                       PUT    /users/:user_id/databases/:database_id/tables/:table_id/relationships/:id(.:format)      relationships#update
#                                       DELETE /users/:user_id/databases/:database_id/tables/:table_id/relationships/:id(.:format)      relationships#destroy
#            user_database_table_fields GET    /users/:user_id/databases/:database_id/tables/:table_id/fields(.:format)                 fields#index
#                                       POST   /users/:user_id/databases/:database_id/tables/:table_id/fields(.:format)                 fields#create
#         new_user_database_table_field GET    /users/:user_id/databases/:database_id/tables/:table_id/fields/new(.:format)             fields#new
#        edit_user_database_table_field GET    /users/:user_id/databases/:database_id/tables/:table_id/fields/:id/edit(.:format)        fields#edit
#             user_database_table_field GET    /users/:user_id/databases/:database_id/tables/:table_id/fields/:id(.:format)             fields#show
#                                       PATCH  /users/:user_id/databases/:database_id/tables/:table_id/fields/:id(.:format)             fields#update
#                                       PUT    /users/:user_id/databases/:database_id/tables/:table_id/fields/:id(.:format)             fields#update
#                                       DELETE /users/:user_id/databases/:database_id/tables/:table_id/fields/:id(.:format)             fields#destroy
#                  user_database_tables GET    /users/:user_id/databases/:database_id/tables(.:format)                                  tables#index
#                                       POST   /users/:user_id/databases/:database_id/tables(.:format)                                  tables#create
#               new_user_database_table GET    /users/:user_id/databases/:database_id/tables/new(.:format)                              tables#new
#              edit_user_database_table GET    /users/:user_id/databases/:database_id/tables/:id/edit(.:format)                         tables#edit
#                   user_database_table GET    /users/:user_id/databases/:database_id/tables/:id(.:format)                              tables#show
#                                       PATCH  /users/:user_id/databases/:database_id/tables/:id(.:format)                              tables#update
#                                       PUT    /users/:user_id/databases/:database_id/tables/:id(.:format)                              tables#update
#                                       DELETE /users/:user_id/databases/:database_id/tables/:id(.:format)                              tables#destroy
#                        user_databases GET    /users/:user_id/databases(.:format)                                                      databases#index
#                                       POST   /users/:user_id/databases(.:format)                                                      databases#create
#                     new_user_database GET    /users/:user_id/databases/new(.:format)                                                  databases#new
#                    edit_user_database GET    /users/:user_id/databases/:id/edit(.:format)                                             databases#edit
#                         user_database GET    /users/:user_id/databases/:id(.:format)                                                  databases#show
#                                       PATCH  /users/:user_id/databases/:id(.:format)                                                  databases#update
#                                       PUT    /users/:user_id/databases/:id(.:format)                                                  databases#update
#                                       DELETE /users/:user_id/databases/:id(.:format)                                                  databases#destroy
#                                 users GET    /users(.:format)                                                                         users#index
#                                       POST   /users(.:format)                                                                         users#create
#                              new_user GET    /users/new(.:format)                                                                     users#new
#                                  user PATCH  /users/:id(.:format)                                                                     users#update
#                                       PUT    /users/:id(.:format)                                                                     users#update
#                                       DELETE /users/:id(.:format)                                                                     users#destroy
#                                  root GET    /                                                                                        generator#index
#                             generator GET    /generator(.:format)                                                                     generator#index
#                                       POST   /                                                                                        generator#create
#

Rails.application.routes.draw do


  get 'session/new'


  post '/login' => 'session#create'

  delete '/login' => 'session#destroy'

  get '/login' => 'session#new'

  resources :users, :except => [:edit] do 
    collection do 
      get 'edit' => 'users#edit'
    end
    resources :databases do
      resources :tables do 
        resources :relationships
        resources :fields
      end
    end

    end

  root :to => 'generator#index'
  get '/generator' => 'generator#index'
  post '/' => 'generator#create'

end
