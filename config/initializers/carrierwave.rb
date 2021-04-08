# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     provider:              'AWS',
#     aws_access_key_id:     Rails.application.credentials[Rails.env.to_sym][:aws_key],
#     aws_secret_access_key: Rails.application.credentials[Rails.env.to_sym][:aws_password],
#     region:                'us-east-1'
#   }
#
#
#   config.fog_public = false
#   config.fog_directory = Rails.application.credentials[Rails.env.to_sym][:aws_bucket]
#
# end
