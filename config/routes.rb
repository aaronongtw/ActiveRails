# == Route Map
#
#                             Prefix Verb   URI Pattern                                                                 Controller#Action
#                        session_new GET    /session/new(.:format)                                                      session#new
#                              login POST   /login(.:format)                                                            session#create
#                                    DELETE /login(.:format)                                                            session#destroy
#                                    GET    /login(.:format)                                                            session#new
#                         edit_users GET    /users/edit(.:format)                                                       users#edit
#                              users GET    /users(.:format)                                                            users#index
#                                    POST   /users(.:format)                                                            users#create
#                           new_user GET    /users/new(.:format)                                                        users#new
#                               user GET    /users/:id(.:format)                                                        users#show
#                                    PATCH  /users/:id(.:format)                                                        users#update
#                                    PUT    /users/:id(.:format)                                                        users#update
#                                    DELETE /users/:id(.:format)                                                        users#destroy
#     database_table_table_relations GET    /databases/:database_id/tables/:table_id/table_relations(.:format)          table_relations#index
#                                    POST   /databases/:database_id/tables/:table_id/table_relations(.:format)          table_relations#create
#  new_database_table_table_relation GET    /databases/:database_id/tables/:table_id/table_relations/new(.:format)      table_relations#new
# edit_database_table_table_relation GET    /databases/:database_id/tables/:table_id/table_relations/:id/edit(.:format) table_relations#edit
#      database_table_table_relation GET    /databases/:database_id/tables/:table_id/table_relations/:id(.:format)      table_relations#show
#                                    PATCH  /databases/:database_id/tables/:table_id/table_relations/:id(.:format)      table_relations#update
#                                    PUT    /databases/:database_id/tables/:table_id/table_relations/:id(.:format)      table_relations#update
#                                    DELETE /databases/:database_id/tables/:table_id/table_relations/:id(.:format)      table_relations#destroy
#              database_table_fields GET    /databases/:database_id/tables/:table_id/fields(.:format)                   fields#index
#                                    POST   /databases/:database_id/tables/:table_id/fields(.:format)                   fields#create
#           new_database_table_field GET    /databases/:database_id/tables/:table_id/fields/new(.:format)               fields#new
#          edit_database_table_field GET    /databases/:database_id/tables/:table_id/fields/:id/edit(.:format)          fields#edit
#               database_table_field GET    /databases/:database_id/tables/:table_id/fields/:id(.:format)               fields#show
#                                    PATCH  /databases/:database_id/tables/:table_id/fields/:id(.:format)               fields#update
#                                    PUT    /databases/:database_id/tables/:table_id/fields/:id(.:format)               fields#update
#                                    DELETE /databases/:database_id/tables/:table_id/fields/:id(.:format)               fields#destroy
#                    database_tables GET    /databases/:database_id/tables(.:format)                                    tables#index
#                                    POST   /databases/:database_id/tables(.:format)                                    tables#create
#                 new_database_table GET    /databases/:database_id/tables/new(.:format)                                tables#new
#                edit_database_table GET    /databases/:database_id/tables/:id/edit(.:format)                           tables#edit
#                     database_table GET    /databases/:database_id/tables/:id(.:format)                                tables#show
#                                    PATCH  /databases/:database_id/tables/:id(.:format)                                tables#update
#                                    PUT    /databases/:database_id/tables/:id(.:format)                                tables#update
#                                    DELETE /databases/:database_id/tables/:id(.:format)                                tables#destroy
#                          databases GET    /databases(.:format)                                                        databases#index
#                                    POST   /databases(.:format)                                                        databases#create
#                       new_database GET    /databases/new(.:format)                                                    databases#new
#                      edit_database GET    /databases/:id/edit(.:format)                                               databases#edit
#                           database GET    /databases/:id(.:format)                                                    databases#show
#                                    PATCH  /databases/:id(.:format)                                                    databases#update
#                                    PUT    /databases/:id(.:format)                                                    databases#update
#                                    DELETE /databases/:id(.:format)                                                    databases#destroy
#                      relationships GET    /relationships(.:format)                                                    relationships#index
#                                    POST   /relationships(.:format)                                                    relationships#create
#                   new_relationship GET    /relationships/new(.:format)                                                relationships#new
#                  edit_relationship GET    /relationships/:id/edit(.:format)                                           relationships#edit
#                       relationship GET    /relationships/:id(.:format)                                                relationships#show
#                                    PATCH  /relationships/:id(.:format)                                                relationships#update
#                                    PUT    /relationships/:id(.:format)                                                relationships#update
#                                    DELETE /relationships/:id(.:format)                                                relationships#destroy
#                               root GET    /                                                                           generator#index
#                                    GET    /generator/:id(.:format)                                                    generator#create
#                                    GET    /generator/tutorial/:id(.:format)                                           generator#tutorial
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
  end

    resources :databases do
      resources :tables do    
        resources :table_relations
        resources :fields
      end
    end

  
  resources :relationships
  root :to => 'generator#index'
  get '/generator/:id' => 'generator#create'
  get '/generator/tutorial/:id' => 'generator#tutorial'

end
