require 'youtube/downloader'

class Video < ActiveRecord::Base
  validates :url, presence: true

  def downloaded?
    video_filename?
  end
end