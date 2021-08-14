require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory = 'www.engidoor.com'
  config.fog_public = false
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'H1wbTnlIBUwvprmSDtoRorPiQ8v9GNHReX6xfatG',
    aws_secret_access_key: 'AKIAX7CWTWTMXDLXZI5W',
    region: 'ap-northeast-1',
    path_style: true
  }
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/www.engidoor.com'
else
  config.storage :file
  config.enable_processing = false if Rails.env.test?
end
end
