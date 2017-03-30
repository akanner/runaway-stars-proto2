//enables submit button
$( ".concreteAnswer" ).on( "click", function( event ) {
  //validates the form
  formSelector = "#runaway-stars-form";
  form          = $(formSelector);
  //don't ignore the hidden fields please!!
  $.validator.setDefaults({
      ignore: [],
  })
  //no messages are displayed
  form.validate({
      errorPlacement: function(error,element) {
        return true;
      }
    });
  if(!form.valid())
  {
    alert("Debe seleccionar al menos una imagen");
    return;
  }
  //shows answer and help text
  var buttonClicked    = $(this);
  var answer =  $('input[name=answer]', formSelector);
  answer.val(buttonClicked.attr("value"));
  starContainer    = $('.star-container');
  showResponse(starContainer,answer.val(),isInTrainingMode());
  //enables submit button
  $("#submit-button").removeClass('hidden');
  $("#submit-button").prop('disabled',false);
  $(this).prop('disabled',true);
  $(".answerBtn").addClass('hidden');

});

//enables submit button
$( ".dontKnowBtn" ).on( "click", function( event ) {
  //shows answer and help text
  var buttonClicked    = $(this);
    formSelector = "#runaway-stars-form";
  var answer =  $('input[name=answer]', formSelector);
  answer.val(buttonClicked.attr("value"));
  starContainer    = $('.star-container');
  showResponse(starContainer,answer.val(),isInTrainingMode());
  //enables submit button
  $("#submit-button").removeClass('hidden');
  $("#submit-button").prop('disabled',false);
  $(this).prop('disabled',true);
  $(".answerBtn").addClass('hidden');

});


