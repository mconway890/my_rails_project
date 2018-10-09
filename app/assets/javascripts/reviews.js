$(function(){
  //Listen for submission of the form
  $("form").submit(function(e){
    e.preventDefault();
    //Get action and method from form itself - this
    var action = $(this).attr('action');
    var method = $(this).attr('method');
    //Store form values in variables to be passed in Ajax request
    var description = $(this).find('#review_description').val();
    var reviewer = $(this).find('#review_reviewer').val();
    //JQuery method to turn form data into object we can use in Ajax call
    var data = $(this).serializeArray();
    //Make ajax request
    $.ajax({
      method: method,
      url: action,
      data: data,
      dataType: 'script'
      //Prevent duplicate form submissions
      return false;
    })
  })
})
