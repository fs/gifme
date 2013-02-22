class FlvToGif
  DEFAULT_OPTIONS = '-pix_fmt rgb24 -r 10 -s 320x240 -y'

  def initialize(path_to_video)
    @path_to_video = path_to_video
  end

  def gif(start_time, duration, path_to_animated)
    `ffmpeg -ss #{start_time} -i #{@path_to_video} -t #{duration} #{DEFAULT_OPTIONS} #{path_to_animated}`
  end
end

# FlvToGif.new('a1Y73sPHKxw.flv').gif('3', '2', 'output.gif')
