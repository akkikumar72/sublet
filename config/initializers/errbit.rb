Airbrake.configure do |config|
  config.api_key = '6c12fd1994e37934b2dac8319cb565af'
  config.host    = 'errors.codebeerstartups.com'
  config.port    = 80
  config.secure  = config.port == 443
end
