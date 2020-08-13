Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end


  namespace :api do
    
    get "/items" => "items#index" #
    get "/items/:id" => "items#show" # <-

    get "/user_items" => "user_items#index" #
    post "/user_items" => "user_items#create" #
    put "/user_items/:id" => "user_items#update" #
    get "/groceries" => "groceries#index"

    post "/users" => "users#create" #
    post "/sessions" => "sessions#create" #

  end
end
