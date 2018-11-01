$(function(){
  // on submit of new ingredient form
  $("#new_ingredient").on("submit", function(event) {
    $.ajax({
      type: "POST",
      url: this.action, // action triggered - form element
      data: $(this).serialize(), // serializes form data
      success: function(resp) {
        // on success update DOM with resp in the form of data
        let ingredient = new Ingredient(resp);
        ingredient.renderIngredients();
      }
    })
    //default action of the event will not be triggered.
    event.preventDefault();
  })
  $("#reverse").on("click", function(event) {
    $.get('/ingredients', function(ingredients) {
      ingredients.reverse()
    }, 'json')
  })
})

// ES6 class syntax
class Ingredient{
  constructor(data) {
    this.id = data.id;
    this.name = data.name;
  }

  renderIngredients(){
    let html = "";
    html +=
    `<ul>
      <li id='ingredient-${this.id}'><a href='/ingredients/${this.id}'">${this.name}</a></li>
    </ul>`;
    $("#ingredient_list").append(html);
  }
};
