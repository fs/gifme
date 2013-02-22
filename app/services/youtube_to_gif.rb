class YoutubeToGif
  def initialize(video_id)
    @video_id = video_id
  end

  def perform!
    perform_download
    perform_gif_generation
  end

  private

  def video
    @video ||= Video.find(@video_id)
  end

  def perform_download
    Downloader.new(video).download!
  end

  def perform_gif_generation
    Gifer.new(video).gif!
  end
end
