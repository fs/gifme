require 'youtube/downloader'

class Video < ActiveRecord::Base
  validates :url, youtube: true

  def downloaded?
    video_filename?
  end
end
