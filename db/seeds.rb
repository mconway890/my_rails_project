# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new
user.email = 'test1@example.com'
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.save!

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
avocado = Ingredient.create!(name: 'avocado')
seaSalt = Ingredient.create!(name: 'sea salt')
pomegranateSeeds = Ingredient.create!(name: 'pomegranate seeds')

avocado_toast_recipe = Recipe.create!(
  user_id: 1,
  name: 'avocado-Pomegranate Sweet Potato Toast',
  prep_time: 10,
  cook_time: 10,
  instructions: 'Toast the sweet potato slices in a toaster for 5 to 10 minutes, or until cooked through and firm-tender. You may need to toast multiple times depending on the toasting length for your toaster.
                 While the sweet potato slices toast, add the avocado to a small bowl and use the back of a fork to mash it to desired consistency. Add the lime juice and sea salt, to taste, and gently mash again to incorporate.
                 Slather each sweet potato toast with the mashed avocado. Top with the pomegranate seeds and hazelnuts or hemp seeds (if using). Season with a pinch of sea salt, if desired, and serve immediately.',
  )

avocado_toast_recipe.recipe_ingredients.new(ingredient: lime, quantity: '1/2 juice')
avocado_toast_recipe.recipe_ingredients.new(ingredient: sweetPotato, quantity: '1 medium')
avocado_toast_recipe.recipe_ingredients.new(ingredient: avocado, quantity: '1 ripe')
avocado_toast_recipe.recipe_ingredients.new(ingredient: seaSalt, quantity: '1 tsp')
avocado_toast_recipe.recipe_ingredients.new(ingredient: pomegranateSeeds, quantity: '1/3 cup')
avocado_toast_recipe.save!

##Create Recipe 2
russetPotatoes = Ingredient.create!(name: 'russet potatoes')
aquafaba = Ingredient.create!(name: 'aquafaba')
brusselSprouts = Ingredient.create!(name: 'brussel sprouts')
oliveOil = Ingredient.create!(name: 'olive oil')

brussel_sprouts_tots = Recipe.create!(
  user_id: 1,
  name: 'Baked Brussel Sprout Tater Tots',
  prep_time: 15,
  cook_time: 30,
  instructions: 'Place the peeled potatoes in a saucepan and fill with cold water. Bring to a boil, and continue boiling until the potatoes are just barely cooked through, about 20 minutes.
                 Preheat the oven to 425 degrees Fahrenheit, and line a baking sheet with parchment paper.
                 Grate the potato into a mixing bowl using the largest holes on your grater.
                 In a small bowl, whisk together the aquafaba and sea salt with a fork. Add about half of this mixture to the grated potato and stir.
                 Add the shredded Brussels sprouts to the bowl along with the rest of the aquafaba mixture. This is just to ensure the salt and aquafaba are distributed evenly, and stir to combine with the potatoes. Taste a pinch of the mixture and add more salt if desired (it wont taste great at this point because of the raw sprouts, but its safe to eat).
                 By hand, form the mixture into small balls or tater tot shapes, squeezing each one gently to compress it a little bit, and place on the prepared baking sheet. Repeat until the mixture is used up. The baking sheet should be large enough that none of the tots are touching. If needed, use a second baking sheet rather than crowding the first one.
                 Brush the tops of the Brussels sprout tater tots with a very light coating of olive oil. Sprinkle with additional salt if desired. Bake for 15 minutes, then very gently flip over the tater tots. Bake for another 15-20 minutes or until lightly browned and crisp.
                 Serve immediately. Leftovers can be stored in an airtight container once completely cooled, and are most successful when reheated in the oven or toaster oven.'
)

brussel_sprouts_tots.recipe_ingredients.new(ingredient: russetPotatoes, quantity: '2 large')
brussel_sprouts_tots.recipe_ingredients.new(ingredient: aquafaba, quantity: '3 tbsp')
brussel_sprouts_tots.recipe_ingredients.new(ingredient: brusselSprouts, quantity: '12 oz')
brussel_sprouts_tots.recipe_ingredients.new(ingredient: oliveOil, quantity: '2 tsp')
brussel_sprouts_tots.recipe_ingredients.new(ingredient: seaSalt, quantity: '1 tsp')
brussel_sprouts_tots.save!
