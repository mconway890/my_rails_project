$(function() {
  //Listen for submission of the form
  $("form").submit(function(e) {
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
    })
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
