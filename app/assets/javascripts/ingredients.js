$(function(){
  $("#new_ingredient").on("submit", function(event) {
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(resp) {
        let ingredient = new Ingredient(resp);
        ingredient.renderIngredients();
      }
    })
    event.preventDefault();
  })
})

function Ingredient(data) {
  this.id = data.id;
  this.name = data.name;
};

Ingredient.prototype.renderIngredients = function() {
  let html = "";
  html +=
  `<ul>
    <li id='ingredient-${this.id}'>${this.name}</li>
  </ul>`;
  $("#ingredient_list").append(html);
}
