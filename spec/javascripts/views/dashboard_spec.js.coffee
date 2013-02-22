describe 'Gifme.Views.Dashboard', ->
  beforeEach ->
    @dashboard = new Gifme.Views.Dashboard

  describe 'events', ->
    describe 'on submit', ->
      it 'sets video url for the video record view from input', ->
        spyOn(Gifme.Views.VideoRecord::, 'render').andCallThrough()
        setFixtures(@dashboard.render())
        expect(@dashboard.videoRecord.url).toEqual('')
        @dashboard.$el.find('input.video-url').val('http://link-to-video.com')
        @dashboard.$el.find('form').trigger('submit')

        expect(@dashboard.videoRecord.url).toEqual('http://link-to-video.com')

      it 'renders Gifme.Views.VideoRecord', ->
        spyOn(Gifme.Views.VideoRecord::, 'render').andCallThrough()
        setFixtures(@dashboard.render())
        @dashboard.$el.find('form').trigger('submit')

        expect(Gifme.Views.VideoRecord::render).toHaveBeenCalled()

  describe 'initialize', ->
    it 'initializes Gifme.Views.VideoRecord', ->
      spyOn(Gifme.Views.VideoRecord::, 'initialize')
      new Gifme.Views.Dashboard
      expect(Gifme.Views.VideoRecord::initialize).toHaveBeenCalled()
