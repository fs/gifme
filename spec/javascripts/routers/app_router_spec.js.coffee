describe 'Gifme.Routers.AppRouter', ->
  beforeEach ->
    @router = new Gifme.Routers.AppRouter

  describe '#dashboard', ->
    it 'renders Gifme.Views.Dashboard', ->
      spyOn(Gifme.Views.Dashboard::, 'render')
      @router.dashboard()
      expect(Gifme.Views.Dashboard::render).toHaveBeenCalled()
