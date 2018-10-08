$(function(){
  $("form").submit(function(e){
    e.preventDefault();
    var action = $(this).attr('action');
    var method = $(this).attr('method');
    var recipe_name = $(this).find('#recipe_name').val();
    var data = $(this).serializeArray();

    $.ajax({
      method: method,
      url: action,
      data: data,
      dataType: 'script'
    })
  })
})