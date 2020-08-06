Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end


  namespace :api do
    
    get "/items" => "items#index" 
    get "/items/:id" => "items#show"

    get "/user_items/" => "user_items#index" #last completed
    post "/user_items/" => "user_items#create" #START HERE!
    get "/user_items/:id" => "user_items#show"
    put "/user_items/:id" => "user_items#update"

    post "/users/" => "user#create"
    post "/sessions/" => "sessions#index"

  end
end
