CarrierWave.configure do |config|
  config.storage = :fog
  config.enable_processing = true

  # fog related options
  config.fog_public = true
  config.fog_directory = ENV['AWS_BUCKET']

  config.fog_credentials = {
    provider: 'AWS',
    region: ENV['AWS_REGION'],
    aws_access_key_id: ENV['AWS_ACCESS_KEY'],
    aws_secret_access_key: ENV['AWS_SECRET_KEY']
  }
end