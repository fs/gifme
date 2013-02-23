# Gifme

## Deploy to Heroku

### Bundled ffmpeg

  heroku config:set PATH=bin:vendor/ffmpeg-heroku/bin:vendor/bundle/ruby/1.9.1/bin:/usr/local/bin:/usr/bin:/bin
  heroku config:set LD_LIBRARY_PATH=vendor/ffmpeg-heroku/lib:/usr/local/lib
