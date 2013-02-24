require 'youtube/downloader'

class Downloader
  attr_accessor :video

  def initialize(video)
    @video = video
  end

  def download!
    perform_download
    update_video_filename
  end

  private

  def perform_download
    Youtube::Downloader.new(video.url, video_filename).download!
  end

  def update_video_filename
    video.video_filename = video_filename
    video.save!
  end

  def video_filename
    @video_filename ||= File.join(Rails.root, 'tmp', "#{SecureRandom.hex}.mp4")
  end
end
