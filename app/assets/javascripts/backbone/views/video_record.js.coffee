class Gifme.Views.VideoRecord extends Backbone.View
  events:
    'click .btn-record': '_toggleRecording'

  bindEvents: ->
    Gifme.Notifier.on('video:embedded', @_enableRecording, @)

  videoParams:
    containerId: 'embedded'
    width: 640
    height: 390
    urlParams: "enablejsapi=1&version=3"
    params: allowScriptAccess: "always"

  initialize: ->
    @started = false
    @bindEvents()

  render: ->
    @$el.html(JST['backbone/templates/app/video_record']())
    @

  embedSWF: (url) ->
    swfobject.embedSWF @_getValidUrl(url),
      @videoParams.containerId,
      @videoParams.width,
      @videoParams.height,
      '8', null, null,
      @videoParams.params,
      id: @videoParams.containerId

  _toggleRecording: ->
    if @started
      @_stopRecord()
    else
      @_startRecord()

  _startRecord: ->
    @$el.find('.btn-record').text('Stop record')
    @started_at = @player.getCurrentTime()
    @started = true

  _stopRecord: ->
    @$el.find('.btn-record').text('Start record')
    @ended_at = @player.getCurrentTime()
    @started = false

  _enableRecording: ->
    @player = $("##{@videoParams.containerId}")[0]
    @$el.find('.btn-record').removeClass('disabled')

  _getValidUrl: (url) ->
    url = $.url(url)
    url = "#{url.attr('protocol')}://#{url.attr('host')}/v/#{url.param('v')}"

    "#{url}?#{@videoParams.urlParams}"
