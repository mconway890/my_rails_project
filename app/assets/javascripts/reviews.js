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
      dataType: 'script',
      // on success update DOM with response in the form of data
      success: function(resp) {
        let review = new Review(resp);
        review.renderReviews();
      }
    })
    document.getElementById('review_form').reset();
  })
})

// The new reviews response is passed as data and set to this
function Review(data) {
  this.id = data.id;
  this.description = data.description;
  this.difficulty = data.difficulty;
  this.reviewer = data.reviewer;
};

// // Prototype method appends the html to the div
Review.prototype.renderReviews = function() {
  let html = "";
  html +=
  `<br>
  <div>
      <h6>Posted by: ${this.reviewer} </h6>
      <p>${this.description} - ${this.difficulty}</p>
  </div>`;

  $("#submitted-reviews").append(html);
};
