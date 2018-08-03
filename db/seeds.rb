# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ingredient_list = [
   ["quinoa"],
   ["almond milk"],
   ["banana"],
   ["almond butter"],
   ["rolled oats"],
   ["kale"],
   ["mango"],
   ["orange"],
   ["strawberries"],
   ["goji berries"],
   ["coconut water"],
   ["mint"],
   ["spinach"]
 ]

 ingredient_list.each do |i|
   Ingredient.create( :name => i[0])
 end

##Create Recipe 1
sweetPotato = Ingredient.create!(name: 'sweet potato')
lime = Ingredient.create!(name: 'lime')
avacado = Ingredient.create!(name: 'avacado')
seaSalt = Ingredient.create!(name: 'sea salt')
pomegranateSeeds = Ingredient.create!(name: 'pomegranate seeds')

avacado_toast_recipe = Recipe.create!(
  user_id: 1,
  name: 'Avacado-Pomegranate Sweet Potato Toast',
  prep_time: 10,
  cook_time: 10,
  instructions: 'Toast the sweet potato slices in a toaster for 5 to 10 minutes, or until cooked through and firm-tender. You may need to toast multiple times depending on the toasting length for your toaster.
                 While the sweet potato slices toast, add the avocado to a small bowl and use the back of a fork to mash it to desired consistency. Add the lime juice and sea salt, to taste, and gently mash again to incorporate.
                 Slather each sweet potato toast with the mashed avocado. Top with the pomegranate seeds and hazelnuts or hemp seeds (if using). Season with a pinch of sea salt, if desired, and serve immediately.',
  )

avacado_toast_recipe.recipe_ingredients.new(ingredient: lime, quantity: '1/2 juice')
avacado_toast_recipe.recipe_ingredients.new(ingredient: sweetPotato, quantity: '1 medium')
avacado_toast_recipe.recipe_ingredients.new(ingredient: avacado, quantity: '1 ripe')
avacado_toast_recipe.recipe_ingredients.new(ingredient: seaSalt, quantity: '1 tsp')
avacado_toast_recipe.recipe_ingredients.new(ingredient: pomegranateSeeds, quantity: '1/3 cup')
avacado_toast_recipe.save!
