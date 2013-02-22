require 'youtube/downloader'
require 'youtube'

class Video < ActiveRecord::Base
  validates :url, youtube: true

  def downloaded?
    video_filename?
  end
end
