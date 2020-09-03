class Api::RecipesController < ApplicationController

  def index
    @user_items = UserItem.where(user_id: current_user.id) 
    p "*" * 45
    @user_items = @user_items.where(used: "false", future_interest: "true")
    api_key = Rails.application.credentials.spoon_api[:api_key]

    @recipes = HTTP
      .get("https://api.spoonacular.com/recipes/findByIngredients?apiKey=#{api_key}&ingredients=apples,flour,sugar&number=3")
      .parse
    

    @recipes.each do |recipe|
      {
      title: recipe["title"],
      image: recipe["image"],
      needIng: recipe["missedIngredients"],
      haveIng: recipe["usedIngredients"],
    }
    end



    
    render "index.json.jb"
    
  end
  
end
