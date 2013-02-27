describe 'Gifme.Views.VideoRecord', ->
  beforeEach ->
    @videoRecord = new Gifme.Views.VideoRecord
    setFixtures(@videoRecord.render().$el)

  describe 'events', ->
    describe 'on Gifme.Notifier video:embedded', ->
      it 'removes disabled class from record button', ->

    describe 'click on .btn-record', ->
      beforeEach ->
        @player = getCurrentTime: -> 2.3
        @videoRecord.player = @player

      describe 'when recording is not started', ->
        it 'sets started to true', ->
          expect(@videoRecord.started).toBeFalsy()
          $('.btn-record').click()

          expect(@videoRecord.started).toBeTruthy()

        it "changes button's text to 'Stop record'", ->
          btn = $('.btn-record').click()
          expect(btn.text()).toEqual('Stop record')

        it 'saves starting time', ->
          expect(@videoRecord.started_at).toEqual(null)
          $('.btn-record').click()
          expect(@videoRecord.started_at).toEqual(@player.getCurrentTime())

      describe 'when recording is started', ->
        beforeEach ->
          @videoRecord._startRecord()

        it 'sets started to false', ->
          expect(@videoRecord.started).toBeTruthy()
          $('.btn-record').click()

          expect(@videoRecord.started).toBeFalsy()

        it "changes button's text to 'Start record'", ->
          btn = $('.btn-record').click()
          expect(btn.text()).toEqual('Start record')

        it 'saves ending time', ->
          expect(@videoRecord.ended_at).toEqual(null)
          $('.btn-record').click()
          expect(@videoRecord.ended_at).toEqual(@player.getCurrentTime())

  describe '#embedSWF', ->
    it 'embeds video from youtube', ->
      spyOn(swfobject, 'embedSWF')
      url = 'http://www.youtube.com/watch?v=RzI9v_B4sxw'
      @videoRecord.embedSWF(url)

      expect(swfobject.embedSWF).toHaveBeenCalledWith(
        'http://www.youtube.com/v/RzI9v_B4sxw?enablejsapi=1&version=3',
        'embedded',
        640
        390
        '8', null, null,
        { allowScriptAccess: 'always' },
        { id: 'embedded' }
      )
