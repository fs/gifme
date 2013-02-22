class Video < ActiveRecord::Base
  validates :url, presence: true

  mount_uploader :gif, VideoGifUploader

  def downloaded?
    video_filename?
  end

  def gifed?
    gif?
  end
end