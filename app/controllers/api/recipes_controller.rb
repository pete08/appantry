class Api::RecipesController < ApplicationController

  def index
    @user_items = UserItem.where(user_id: current_user.id) 
    p "*" * 45
    @user_items = @user_items.where(used: "false", future_interest: "true")
    
    items = []
    @user_items.each do |item|
      item = item["name"]
      item = item.downcase
      items << item.gsub(/\s+/, "%20")
      
    end
    p"*" * 45
    p"*" * 45
    p "items: "
    p items
    p"*" * 45
    p"*" * 45
    
    
    api_key = Rails.application.credentials.spoon_api[:api_key]
    count = 3
    url = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=#{api_key}&number=#{count}&ingredients="
    
    append = ""
    items.each do |item|
      append += item + "," 
    end
    url_full = url + append
    p"*" * 45
    p"*" * 45
    p url_full
    p"*" * 45
    
    @data = HTTP
    .get(url_full)
    .parse

    p "@data.class: "
    p @data.class
    p "*" * 45 
    
  #   p "*" * 45
  #   p "*" * 45
  #   p @data.class
  #   p "*" * 45
  #   p "*" * 45
  
    @recipes_list = []
    @data.each do |recipe|
      recipe_temp = {}
      id = recipe["id"]
      recipe_temp[:id] = recipe["id"]
      recipe_temp[:image] = recipe["image"]
      recipe_temp[:title] = recipe["title"]

      need = recipe["missedIngredients"]
      need_temp = []
      
      if need
        need.each do |ingred|
          if ingred["name"] 
            need_temp << ingred["name"]
          end
        end
      end
      recipe_temp[:need] = need_temp


      have = recipe["usedIngredients"],
      have_temp = []

      if recipe["usedIngredients"]
        recipe["usedIngredients"].each do |ingred|
          if ingred["name"] 
            have_temp << ingred["name"]
          end
        end
      end
      recipe_temp[:have] = have_temp

      #####################################################
      #############Obtain Recipes' Steps####################
      @recipe_directions = HTTP
        .get("https://api.spoonacular.com/recipes/#{id}/analyzedInstructions?apiKey=#{api_key}")
        .parse
      if @recipe_directions[0] != nil
        recipe_steps = @recipe_directions[0]["steps"]
        steps_temp = []
        recipe_steps.each do |step|
          steps_temp << step["step"]
        end
      end
      
      recipe_temp[:steps]  = steps_temp
      #############Obtain Recipes' Steps####################
      #####################################################
      
      
      
      @recipes_list.append(recipe_temp)
    end
    


    ######################Get REcipe Instructions Per Recipe ID########USE Count to track which recipe goes with recipe instructions##############
    # @recipes_ids = []                               # List of recipe Ids
    # @recipes.each do |recipe|
    #   recipes_ids["id"] = recipe[:id]
    # @recipes_instructions = HTTP                  # Get API Call for recipe per recipe Id from @recipes_ids
    #   .get("https://api.spoonacular.com/recipes/611026/analyzedInstructions?apiKey=#{api_key}")
    #   .parse
    #################################################################################

    
    render "index.json.jb"
    
  end
  
  
end