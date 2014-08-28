require 'carrierwave/mongoid'
CarrierWave.configure do |config|
 
  config.grid_fs_access_url = "/fileuploads"

end