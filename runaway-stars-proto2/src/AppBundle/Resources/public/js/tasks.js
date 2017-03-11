//delay de form submittion for 3 seconds and shows an animation
    $( "#runaway-stars-form" ).submit(function( event ) {
        //shows animation
        $.blockUI({ message: $('#throbber') });
        //delay for 3 seconds
        form = this;
       event.preventDefault();
       setTimeout( function () {
           form.submit();
       }, 1000);
    });
    //enables submit button
    $( ".answerBtn" ).on( "click", function( event ) {
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

    //shows the help modal
    $(window).load(function(){
      showHelp = $("#show_help").text();
      if(showHelp=="true")
      {
        $('#help_modal').modal('show');
      }
        
    });