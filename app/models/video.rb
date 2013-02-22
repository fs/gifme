class Video < ActiveRecord::Base
  validates :url, :start, :duration, presence: true
  attr_accessible :url, :start, :duration

  mount_uploader :gif, VideoGifUploader

  def downloaded?
    video_filename?
  end

  def gifed?
    gif?
  end
end