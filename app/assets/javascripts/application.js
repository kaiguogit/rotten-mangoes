// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

$(function () {
 
  $("#rateYo").rateYo({
    rating: 1,
    fullStar: true
  });

  $(".rateYo-review").each(function(i,obj){
    $(obj).rateYo({
      rating: $(obj).attr("data-rating"),
      fullStar: true,
      readOnly: true,
      starWidth: "20px"
    });
  });
  
  $(".rateYo-review-average").each(function(i,obj){
    $(obj).rateYo({
      rating: $(obj).attr("data-rating"),
      readOnly: true
    });
  });

  $("#rateYo").rateYo()
              .on("rateyo.change", function (e, data) {
  
                var rating = data.rating;
                $(this).next().val(rating);
              });
});