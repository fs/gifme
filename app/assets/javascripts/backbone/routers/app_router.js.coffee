class Gifme.Routers.AppRouter extends Backbone.Router
  initialize: ->
    @container = '.app-container'

  routes:
    "": 'dashboard'

  dashboard: ->
    dashboard = new Gifme.Views.Dashboard(el: @container)
    dashboard.render()
