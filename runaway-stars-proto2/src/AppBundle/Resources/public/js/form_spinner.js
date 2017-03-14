//delays form submittion for 1 second and shows an animation
$( "#runaway-stars-form" ).submit(function( event ) {
    //shows animation
    $.blockUI({ message: $('#throbber') });
    //delay for 1 second
    form = this;
   event.preventDefault();
   setTimeout( function () {
       form.submit();
   }, 1000);
});