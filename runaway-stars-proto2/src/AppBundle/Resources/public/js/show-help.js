//shows the help modal
$(window).on("load",function(){
  showHelp = $("#show_help").text();
  if(showHelp=="true")
  {
    $('#help_modal').modal('show');
  }
    
});