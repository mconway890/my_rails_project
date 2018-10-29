$(function() {
  //Listen for submission of the form
  $("#recipe_form").submit(function(e) {
    e.preventDefault();
    //Get action and method from form itself - this
    let action = $(this).attr('action');
    let method = $(this).attr('method');
    //Store form values in variables to be passed in Ajax request
    let recipe_name = $(this).find('#recipe_name').val();
    //JQuery method to turn form data into object we can use in Ajax call
    let data = $(this).serializeArray();
    //Make ajax request
    $.ajax({
      method: method,
      url: action,
      data: data,
      dataType: 'script'
    }).then(function(result){
      return alert('Recipe Added!')
    }).catch(function(result){
      return alert('Error!')
    })
    document.getElementById('recipe_form').reset();
  })
})

function timeSavers() {
  $('#quick').load('quickest.html #quick')
  let e = document.getElementById('quick');
  if (e.style.display != 'none') {
    e.style.display = 'none';
  } else {
    e.style.display = '';
  }
}

function renderReviews(id) {
  let r = document.getElementById(id);
  if (r.style.display == 'block')
    r.style.display = 'none';
  else
    r.style.display = 'block'
}
