$(function(){
  $("form").submit(function(e){
    e.preventDefault();

    var action = $(this).attr('action');
    var method = $(this).attr('method');

    var description = $(this).find('#review_description').val();
    var reviewer = $(this).find('#review_reviewer').val();

    var data = $(this).serializeArray();
    $.ajax({
      method: method,
      url: action,
      data: data,
      dataType: 'script'

      return false;
    })
  })
})
