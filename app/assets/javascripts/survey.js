$(document).ready(function(){
  $("#add-question").on('click', function(event){
    event.preventDefault()
     $data = $(event.target).attr('survey_id')
    $.ajax({
      url: "/questions/form",
      method: "POST",
      data: {data: parseInt($data)}
      })
    .done(function(questionForm){
      $("body").prepend(questionForm);
    })
    .fail(function(){
      console.log("raise some fucking hell");
    });
  });
});
