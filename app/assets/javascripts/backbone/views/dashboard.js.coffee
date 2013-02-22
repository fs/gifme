class Gifme.Views.Dashboard extends Backbone.View
  initialize: ->
    @videoRecord = new Gifme.Views.VideoRecord

  events:
    'submit form.new-video': 'renderVideoRecord'

  render: ->
    @$el.html(JST['backbone/templates/app/dashboard']())
    @_hideErrors()
    @

  renderVideoRecord: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize(@)

    if data['url'].trim().length
      @videoRecord.url = data['url']
      @_hideErrors()
      @_hideForm()
      @$el.find('.video').append(@videoRecord.render().$el)
      @videoRecord.embedSwf()
    else
      @_showErrors()

  _hideForm: ->
    @$el.find('form').hide()

  _hideErrors: ->
    @$el.find('.errors').hide()

  _showErrors: ->
    @$el.find('.errors').show()

