class Video < ActiveRecord::Base
  validates :url, presence: true
  validates :start, :duration, numericality: { only_integer: true, greater_than: 0 }

  attr_accessible :url, :start, :duration

  mount_uploader :gif, VideoGifUploader

  def downloaded?
    video_filename?
  end

  def gifed?
    gif?
  end
end
