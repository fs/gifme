class Downloader
  def initialize(video_id)
    @video_id = video_id
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
    video.update_attribute(:video_filename, video_filename)
  end

  def video
    @video ||= Video.find(@video_id)
  end

  def video_filename
    @video_filename ||= File.join(Dir.tmpdir, "#{SecureRandom.hex}.flv")
  end
end