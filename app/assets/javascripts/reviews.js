$(function(){
  //Listen for submission of the form
  $("#review_form").submit(function(e){
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
      //Prevent duplicate form submissions
      //return false;
    })
    document.getElementById('review_form').reset();
  })
})

// Js model object with method added to prototype
function Review(reviewer, description, difficulty) {
  this.reviewer = reviewer;
  this.description = description;
  this.difficulty = difficulty;
}

Review.prototype.fullReview = function() {
  console.log(`Review by: ${this.reviewer} | Description: ${this.description} | Difficulty: ${this.difficulty}`);
}
//
// let m = new Review('Michele','delicious!', 2);
// m.fullReview();
// Review by: Michele | Description: so delicious! | Difficulty: 2
//
