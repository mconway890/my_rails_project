$(function(){
  $(".view-user-recipes").on("click", function(event){
    // assign i to data-id, equal to @user.id
    let i = $(".view-user-recipes").attr("data-id");
    $.get("/users/" + i + ".json", function(data){
      // pass data to getUserRecipes
      getUserRecipes(data)
    })
    event.preventDefault();
  })
})

function getUserRecipes(data){
  let recipes = data["recipes"];
  // set div in DOM to variable
  let recipesDiv = $(".usersRecipes");
  // empty div before appending
  recipesDiv.empty();
  // set JSON to variables
  let userId = data["id"];
  let email = data["email"]
  $.each(recipes, function(i, recipe){
    // append html recipes info 
    recipesDiv.append(
      `<div>
        <h4>${recipe.name}</h4>
      </div>`
    )
  })
}
