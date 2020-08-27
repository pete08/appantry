ingred_full = 
[  
  {
    "id": 19316,
    "cuisine": "mexican",
    "ingredients": [
      "eggs",
      "Country Crock® Spread",
      "queso fresco",
      "flour tortillas",
      "ground beef",
      "ground beef",
      "ground beef",
      "sliced green onions",
      "hellmann' or best food real mayonnais"
    ]
  },
  {
    "id": 34554,
    "cuisine": "mexican",
    "ingredients": [
      "ground beef",
      "purple onion",
      "purple onion",
      "purple onion",
      "purple onion",
      "purple onion",
      "purple onion",
      "purple onion",
      "avocado",
      "chopped cilantro fresh",
      "Knorr® Beef Bouillon",
      "bread crumb fresh",
      "sliced mushrooms",
      "garlic",
      "Hellmann' or best food real mayonnais",
      "grated parmesan cheese",
      "frozen crabmeat, thaw and drain"
    ]
  },
]


character = "®"
character1 = "or"
character2 = "hellman"


items = []
  
ingred_full.each do |recipe|
  ingredients = recipe[:ingredients]

  ingredients.each do |item|
    unless item.include?(character)
      unless item.include?(character1)
        unless item.include?(character2.downcase)
          items << item
        end
      end
    end
  end

end

p "items length: "
p items.length
items = items.uniq

p "items length after .uniq: "
p items.length
p items