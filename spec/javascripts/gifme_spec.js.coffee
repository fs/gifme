describe 'Gifme', ->
  beforeEach ->
    Backbone.history.stop()

  describe '#initialize', ->
    it 'starts backbone history', ->
      Backbone.history.started = false
      spyOn(Backbone.history, 'start')
      Gifme.initialize()
      expect(Backbone.history.start).toHaveBeenCalled()

    it 'initializes routers', ->
      spyOn(window.Gifme.Routers, 'AppRouter')
      Gifme.initialize()
      expect(Gifme.Routers.AppRouter).toHaveBeenCalled()
