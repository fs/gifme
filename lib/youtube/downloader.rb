require 'fileutils'

# Will save downlaoded video to /tmp/test.mp4
#
#   require 'youtube/downloader'
#   Youtube::Downloader.new('https://www.youtube.com/watch?v=jHvmgOqwI1o', '/tmp/test.mp4').download!
#
module Youtube
  class Downloader
    YOUTUBE_DL = 'bin/youtube-dl'
    YOUTUBE_DL_OPTIONS = [
      '--no-progress',
      '--max-filesize 100m',
      '--format 18' # mp4
    ]

    def initialize(url, output_path)
      @url, @output_path = url, output_path
    end

    def download!
      handle_error do
        Rails.logger.debug "Youtube: #{command}"

        `#{command}`.strip
      end
    end

    private

    def handle_error
      result = yield
      raise result.to_s unless $?.to_i == 0
    end

    def command
      "#{youtube_dl} #{options} #{@url}"
    end

    def youtube_dl
      File.join(File.expand_path(File.dirname(__FILE__)), YOUTUBE_DL)
    end

    def options
      YOUTUBE_DL_OPTIONS.push(output_options).join(' ')
    end

    def output_options
      %{--output "#{@output_path}"}
    end
  end
end
