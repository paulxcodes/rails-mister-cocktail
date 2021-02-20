require 'open-uri'
require 'json'

puts 'cleaning ingredients'
Ingredient.destroy_all

puts "Creating ingredients..."

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredients = JSON.parse(ingredient_serialized)

ingredients['drinks'].each do |ingredient|
  new_ingredient = Ingredient.create(
    name: ingredient['strIngredient1']
  )
  puts "Ingredient #{new_ingredient.id} is created"
end

