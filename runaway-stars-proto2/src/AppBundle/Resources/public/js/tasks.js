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
    $( "#answer-button" ).on( "click", function( event ) {
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
      radioSelected    = $('input[name=answer]:checked', '#runaway-stars-form');
      starContainer    = radioSelected.parents('.star-container');
      showResponse(starContainer,isInTrainingMode());
      //enables submit button
      $("#submit-button").prop('disabled', false);
      $(this).prop('disabled',true);
      $(" input:radio").addClass('hidden');
      //adds points
      addPointsFor(starContainer);
    });

    //shows the help modal
    $(window).load(function(){
      showHelp = $("#show_help").text();
      if(showHelp=="true")
      {
        $('#help_modal').modal('show');
      }
        
    });