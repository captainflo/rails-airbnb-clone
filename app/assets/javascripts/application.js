//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
//= require underscore
//= require gmaps/google

$('#star-rating').raty({
  path: '/assets/',
  scoreName: 'review[rating]'
});

$('.star-rating').raty({
  path: '/assets/',
  readOnly: true,
  score: function() {
    return $(this).attr('data-score');
  }
});
