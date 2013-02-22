require 'youtube/downloader'

class Video
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :url, :filename
  validates :url, presence: true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def download!
    Youtube::Downloader.new(url, generate_filename).download!
  end

  def persisted?
    false
  end

  private

  def generate_filename
    self.filename = File.join(Dir.tmpdir, "#{SecureRandom.hex}.flv")
  end
end