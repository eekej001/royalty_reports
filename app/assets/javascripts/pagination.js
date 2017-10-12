 $(document).ready(function() {

  $("#paginate-load").hide();




$(function() {
  $(".sort_paginate_ajax").on("click", ".pagination a", function(){
    $("#filler-space").hide();
    $("#paginate-load").show();
    $.getScript(this.href);
    return false;
    
  });
});


});
