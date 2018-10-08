$(function(){
  $("form").submit(function(e){
    e.preventDefault();
    var action = $(this).attr('action');
    var method = $(this).attr('method');
    var recipe_name = $(this).find('#recipe_name').val();
    var recipe_instructions = $(this).find('#recipe_instructions').val();
    var recipe_prep_time = $(this).find('#recipe_prep_time').val();
    var recipe_cook_time = $(this).find('#recipe_cook_time').val();
    var recipe_ingredients = $(this).find('#recipe_recipe_ingredients_attributes_0_ingredient_name').val();

    var data = $(this).serializeArray();

    $.ajax({
      method: method,
      url: action,
      data: data,
      dataType: 'script'
    })
  })
})
