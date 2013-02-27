describe 'Gifme.Views.Dashboard', ->
  beforeEach ->
    @dashboard = new Gifme.Views.Dashboard

  describe 'events', ->
    describe 'on submit', ->
      describe 'when input is blank', ->
        it 'shows error', ->
          setFixtures(@dashboard.render().$el)
          @dashboard.$el.find('form').trigger('submit')
          expect($('.errors')).toBeVisible()

        it 'does not calls embedSWF with video url', ->
          spyOn(Gifme.Views.VideoRecord::, 'embedSWF')
          setFixtures(@dashboard.render())
          @dashboard.$el.find('form').trigger('submit')

          expect(Gifme.Views.VideoRecord::embedSWF).not.toHaveBeenCalled()

      describe 'when input is present', ->
        it 'calls embedSWF with video url', ->
          spyOn(Gifme.Views.VideoRecord::, 'embedSWF')
          url = 'http://link-to-video.com'
          setFixtures(@dashboard.render())
          @dashboard.$el.find('input.video-url').val(url)
          @dashboard.$el.find('form').trigger('submit')

          expect(Gifme.Views.VideoRecord::embedSWF).toHaveBeenCalledWith(url)

        it 'hides error', ->
          setFixtures(@dashboard.render())
          @dashboard.$el.find('form').trigger('submit')
          @dashboard.$el.find('input.video-url').val('http://link-to-video.com')
          @dashboard.$el.find('form').trigger('submit')
          expect(@dashboard.$el.find('.errors')).toBeHidden()

        it 'hides form', ->
          setFixtures(@dashboard.render())
          @dashboard.$el.find('input.video-url').val('http://link-to-video.com')
          @dashboard.$el.find('form').trigger('submit')
          expect(@dashboard.$el.find('form')).toBeHidden()

        it 'renders Gifme.Views.VideoRecord', ->
          spyOn(Gifme.Views.VideoRecord::, 'render').andCallThrough()
          setFixtures(@dashboard.render())
          @dashboard.$el.find('input.video-url').val('http://link-to-video.com')
          @dashboard.$el.find('form').trigger('submit')

          expect(Gifme.Views.VideoRecord::render).toHaveBeenCalled()

  describe 'render', ->
    it 'hides errors', ->
      setFixtures(@dashboard.render())
      expect(@dashboard.$el.find('.errors')).toBeHidden()

  describe 'initialize', ->
    it 'initializes Gifme.Views.VideoRecord', ->
      spyOn(Gifme.Views.VideoRecord::, 'initialize')
      new Gifme.Views.Dashboard
      expect(Gifme.Views.VideoRecord::initialize).toHaveBeenCalled()
