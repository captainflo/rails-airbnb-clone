// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the rails generate channel command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);

$(document).ready(function(){
$('.folder').hover(function(){
  $(this).html('<i class="fa fa-folder-open" aria-hidden="true"></i>');},
  function(){
    $(this).html('<i class="fa fa-folder" aria-hidden="true"></i>');

  });
});
