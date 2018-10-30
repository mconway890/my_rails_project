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
    event.preventDefault();
  })
})

// new ingredient resp passed as data and set to 'this'
function Ingredient(data) {
  this.id = data.id;
  this.name = data.name;
};

// append html to div with id 'ingredient_list'
Ingredient.prototype.renderIngredients = function() {
  let html = "";
  html +=
  `<ul>
    <li id='ingredient-${this.id}'><a href='/ingredients/${this.id}'">${this.name}</a></li>
  </ul>`;
  $("#ingredient_list").append(html);
}
