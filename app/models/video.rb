class Video
  include DataMapper::Resource

  with_options required: true do |klass|
    property :url, String
    property :start, Integer
    property :duration, Integer
  end

  property :id, Serial
  property :video_filename, String

  mount_uploader :gif, VideoGifUploader

  def downloaded?
    video_filename?
  end

  def gifed?
    gif?
  end
end
