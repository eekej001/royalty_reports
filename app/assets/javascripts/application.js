// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
 require active_resource
//= require turbolinks
//= require modals
//= require_tree .
 require checkout


$(function() {
 // $(".sort_paginate_ajax th a, .sort_paginate_ajax .pagination a").on("click", function(){
 	$(".sort_paginate_ajax").on("click", ".pagination a", function(){
    $.getScript(this.href);
    alert("Performing Ajax");
    console.log("Application.js logging here");
    return false;
  });
});