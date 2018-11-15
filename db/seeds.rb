# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

30.times do |n|
  name = ingredients["drinks"][n].values
  Ingredient.create!(name: name)
end

cocktail_url = 'https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json'
cocktails_names = open(cocktail_url).read
cocktails = JSON.parse(cocktails_names)

cocktails.first(15).each do |c|
  Cocktail.create(name: c['name'])
end
