require 'fileutils'

# Will save downlaoded video to /tmp/test.flv
#
#   require 'youtube/downloader'
#   Youtube::Downloader.new('https://www.youtube.com/watch?v=jHvmgOqwI1o', '/tmp/test.flv').download!
#
module Youtube
  class Downloader
    YOUTUBE_DL = 'bin/youtube-dl'
    YOUTUBE_DL_OPTIONS = [
      '--no-progress',
      '--max-filesize 100m',
      '--format 5'
    ]

    def initialize(url, output_path)
      @url, @output_path = url, output_path
    end

    def download!
      handle_error do
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