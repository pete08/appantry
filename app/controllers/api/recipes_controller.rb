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

  #   PRINT OUT ITEMS TO SEE WHAT SPOONACULAR API IS RECEIVING AS ITEMS ARRAY
    p"*" * 45
    p "items: "
    p items
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

    # p "@data.class: "
    # p @data.class
    # p "*" * 45 
    
    # p "*" * 45
    # p @data 
    # p "*" * 45
  
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
      #############Obtain Recipes' URLs####################
      @recipe_info = HTTP
        .get("https://api.spoonacular.com/recipes/#{id}/information?apiKey=#{api_key}")
        .parse
      p @recipe_info

      # if @recipe_info[0] != nil
      source_url = @recipe_info["sourceUrl"]
      #   steps_temp = []
      #   recipe_steps.each do |step|
      #     steps_temp << step["step"]
      #   end
      # end
      recipe_temp[:sourceUrl]  = source_url
      #############Obtain Recipes' URL####################
      #####################################################


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
      
      
      Recipe.create(title: recipe_temp["title"], image: recipe_temp["image"], source_url: source_url, user_id: current_user.id, use: "")

      @recipes_list.append(recipe_temp)
    end
    

    # @recipes_list = [
    #   {
    #     "id": 624954,
    #     "image": "https://spoonacular.com/recipeImages/624954-312x231.jpg",
    #     "title": "Easy Breakfast Pizza",
    #     "need": [
    #       "bacon",
    #       "butter",
    #       "eggs",
    #       "oranges",
    #       "peppers",
    #       "yeast"
    #     ],
    #     "have": [
    #       "ham",
    #       "sausage links"
    #     ],
    #     "steps": [
    #       "Preheat oven to 400 degrees and line a cookie sheet with parchment paper or spray with non-stick cooking spray",
    #       "In a large mixing bowl, combine 1 cup flour, undissolved yeast, sugar and salt",
    #       "Add very warm water and oil and mix until blended, about 1 minute",
    #       "Gradually add enough flour to make a soft dough. Doug should form a ball but will be slightly sticky",
    #       "Turn onto floured surface and knead dough until smooth and elastic, about 4 minutes",
    #       "Divide dough into 8 equal portions, roll out each portion into a circle.",
    #       "Place on cookie sheet.Melt butter in skillet over medium heat",
    #       "Combine eggs and  cup cheese in a bowl, add to melted butter",
    #       "Scramble egg mixture for 2-3 minutes, eggs are ready when almost set, but still slightly under cooked",
    #       "Divide eggs and spread on top of each pizza",
    #       "Sprinkle top with additional cheese for hair",
    #       "Bake for about 10 minutes or until pizza is golden brown and eggs are set",
    #       "To add a face, cut pieces of ham, bacon, peppers, broccoli, oranges, anything you like and create a face"
    #     ]
    #   },
    #   {
    #     "id": 719320,
    #     "image": "https://spoonacular.com/recipeImages/719320-312x231.png",
    #     "title": "20 Celebration ! + $500 GIVEAWAY",
    #     "need": [
    #       "apple"
    #     ],
    #     "have": [
    #       "breakfast links"
    #     ],
    #     "steps": ["none"]
    #   },
    #   {
    #     "id": 469470,
    #     "image": "https://spoonacular.com/recipeImages/469470-312x231.jpg",
    #     "title": "Ham Kabobs",
    #     "need": [
    #       "cherry tomatoes",
    #       "cooked ham",
    #       "green peppers",
    #       "onion",
    #       "pineapple chunks",
    #       "sweet potatoes",
    #       "white vinegar"
    #     ],
    #     "have": [
    #       "sausage links"
    #     ],
    #     "steps": [
    #       "In a small bowl, combine vinegar and brown sugar.",
    #       "Pour half of the marinade into a large resealable plastic bag; add ham and sausage. Seal bag and turn to coat; refrigerate for at least 2 hours. Refrigerate remaining marinade for basting.",
    #       "Place sweet potatoes and water in a microwave-safe dish. Cover and microwave on high for 4 minutes or until tender.",
    #       "Drain and discard marinade. On eight metal or soaked wooden skewers, alternately thread the ham, sausage, sweet potatoes, green peppers, onion, tomatoes and pineapple.",
    #       "Grill, covered, over medium heat or broil 4-6 in. from the heat for 8-10 minutes or until a thermometer inserted in the sausage reads 160° and vegetables are tender, turning and basting occasionally with reserved marinade."
    #     ]
    #   }
    # ]

    
    render "index.json.jb"
    
  end
  
  
end