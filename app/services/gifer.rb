require 'flv_to_gif'

class Gifer
  attr_accessor :video

  def initialize(video)
    @video = video
  end

  def gif!
    return unless video_ready?

    perform_gif_generation
    update_gif
  end

  private

  def video_ready?
    video.downloaded?
  end

  def gif_filename
    @gif_filename ||= File.join(Dir.tmpdir, "#{SecureRandom.hex}.gif")
  end

  def perform_gif_generation
    FlvToGif.new(video.video_filename).gif('3', '2', gif_filename)
  end

  def update_gif
    video.gif = File.open(gif_filename)
    video.save!
  end
end