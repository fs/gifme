class Gifme.Views.Dashboard extends Backbone.View
  initialize: ->
    @videoRecord = new Gifme.Views.VideoRecord

  events:
    'submit form.new-video': 'renderVideoRecord'

  render: ->
    @$el.html(JST['backbone/templates/dashboard/index']())
    @

  renderVideoRecord: (event) ->
    event.preventDefault()

    data = Backbone.Syphon.serialize(@)
    @videoRecord.url = data['url']

    @$el.html(@videoRecord.render().$el)

