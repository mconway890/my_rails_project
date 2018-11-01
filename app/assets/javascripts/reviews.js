$(function(){
  //Listen for submission of the form
  $("#review_form").on("submit", function(e){
    e.preventDefault();
    //Get action and method from form itself - this
    let action = $(this).attr('action');
    let method = $(this).attr('method');
    //Store form values in variables to be passed in Ajax request
    let description = $(this).find('#review_description').val();
    let reviewer = $(this).find('#review_reviewer').val();
    let difficulty = $(this).find('#review_difficulty').val();
    //JQuery method to turn form data into object we can use in Ajax call
    let data = $(this).serializeArray();
    //Make ajax request
    $.ajax({
      method: method,
      url: action,
      data: data,
      dataType: 'script'
    }).then(function(result){
      return alert('Review Added!')
      // catch() returns a Promise dealing with rejected cases
    }).catch(function(result){
      return alert('Error!')
    })
    document.getElementById('review_form').reset();
  })
})
