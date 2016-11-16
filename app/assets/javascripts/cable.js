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

$('.folder').hover(function(){
  $(this).html('<i class="fa fa-folder-open-o" aria-hidden="true"></i>');},
  function(){
    $(this).html('<i class="fa fa-folder-o" aria-hidden="true"></i>');

  })
