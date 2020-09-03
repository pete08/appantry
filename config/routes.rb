Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end


  namespace :api do

    get "/groceries" => "groceries#index"# 
    get "/groceries/:id" => "groceries#show" 
    post "/groceries" => "groceries#create" # 
    put "/groceries/:id" => "groceries#update" # 
    
    get "/items" => "items#index" #
    get "/items/:id" => "items#show" # 
    
    get "/user_items" => "user_items#index" # 
    get "/user_items/:id" => "user_items#show" 
    post "/user_items" => "user_items#create" # 
    put "/user_items/:id" => "user_items#update" # 
    delete "/user_items/:id" => "user_items#destroy" # 

    post "/users" => "users#create" #
    get "/users/:id" => "users#show" # 
    post "/sessions" => "sessions#create" #

    get "/recipes" => "recipes#index"
    

  end
end
