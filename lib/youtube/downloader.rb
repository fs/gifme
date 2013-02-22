require 'fileutils'

# Youtube::Downloader.new('https://www.youtube.com/watch?v=jHvmgOqwI1o', '/tmp/test')
#
module Youtube
  class Downloader
    YOUTUBE_DL = 'bin/youtube-dl'
    YOUTUBE_DL_OPTIONS = [
      '--no-progress',
      '--format 5'
    ]

    def initialize(url, output_path)
      @url, @output_path = url, output_path

      download!
    end

    private

    def download!
      `#{command}`.strip
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
      %{--output "#{output_path}/%(id)s.%(ext)s"}
    end

    def output_path
      FileUtils.mkdir_p(@output_path).first
    end
  end
end