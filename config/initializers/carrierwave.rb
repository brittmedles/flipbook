CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => "AWS",
    :aws_access_key_id     => "AKIAJXYSDJPAOPXBCI4A",
    :aws_secret_access_key => "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",
    :region                => "us-east-1"
  }
  
  config.fog_directory = "flipbookv2"
end