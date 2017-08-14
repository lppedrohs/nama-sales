CarrierWave.configure do |config|
  config.storage           = :file
  config.asset_host        = Rails.application.secrets.assets_host
  config.enable_processing = Rails.env.development?
end
