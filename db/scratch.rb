ingred_full = [
  {
    "id": 18009,
    "ingredients": [
      "baking powder",
      "eggs",
      "all-purpose flour",
      "raisins",
      "milk",
      "white sugar"
    ]
  },
  {
    "id": 28583,
    "ingredients": [
      "sugar",
      "egg yolks",
      "corn starch",
      "cream of tartar",
      "bananas",
      "vanilla wafers",
      "milk",
      "vanilla extract",
      "toasted pecans",
      "egg whites",
      "light rum"
    ]
  }
]

items = []
  
ingred_full.each do |recipe|
  ingredients = recipe[:ingredients]

  ingredients.each do |item|
    items << item
  end

end

p items

