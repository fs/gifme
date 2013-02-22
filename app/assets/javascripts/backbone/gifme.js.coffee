#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Gifme =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  initialize: ->
    @router = new Gifme.Routers.AppRouter

    Gifme.Notifier = _.clone(Backbone.Events)

    unless Backbone.history.started
      Backbone.history.start()
      Backbone.history.started = true
