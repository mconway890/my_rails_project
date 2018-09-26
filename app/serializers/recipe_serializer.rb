class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructions, :prep_time, :cook_time, :user_id, :ingredients
  belongs_to :user

  def self.serialize(recipe)
    serialized_recipe = '{'
    serialized_recipe += '"id": ' + recipe.id.to_s + ', '
    serialized_recipe += '"name": "' + recipe.name + '", '
    serialized_recipe += '"prep_time": "' + recipe.prep_time.to_s + '", '
    serialized_recipe += '"cook_time": "' + recipe.cook_time.to_s + '", '
    serialized_recipe += '"instructions": "' + recipe.instructions + '", '
    serialized_recipe += '"ingredients": "' + recipe.ingredients + '", '
    serialized_recipe += '"user": {'
    serialized_recipe += '"email": "' + recipe.user.email + '"}'
    serialized_recipe += '}'
  end
end
