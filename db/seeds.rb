# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: Star Wars }, { name: Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# food = [
# "bread crumbs",
# "Couscous",
# "Rice",
# "flour",
# "White sugar",
# "Brown sugar",
# "Powdered sugar",
# "Baking powder",
# "Active dry yeast",
# "Chicken stock",
# "Beef stock"
# ]

# food.each do |item|
#   item = item.downcase
#   Item.create(name: item, container: "pantry")
# end


# User.create(email: "red@mail.com", ppl_in_house: 2)
# User.create(email: "alabaster@email.com", ppl_in_house: 1)
# User.create(email: "greeves@email.com", ppl_in_house: 4)
# User.create(email: "yellow@email.com", ppl_in_house: 1)
# User.create(email: "teal@email.com", ppl_in_house: 2)
# User.create(email: "hue@email.com", ppl_in_house: 3)
# User.create(email: "opulent@email.com", ppl_in_house: 4)

# UserItem.create(item_id: 17, user_id: 5, buy_date: Date.new(2020, 06, 10), used: false, future_interest: true)

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

ingred_full.each do |recipe|
  ingredients = recipe[:ingredients]

  ingredients.each do |item|
    Item.create(name: "#{item}")
    p Item.last
  end
end

