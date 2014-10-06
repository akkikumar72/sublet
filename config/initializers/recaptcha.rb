if Rails.env.development?

  Recaptcha.configure do |config|
    config.public_key  = '6LdYdfsSAAAAAJKFIdYpf0b1nUaksumY1PwYnIyl'
    config.private_key = '6LdYdfsSAAAAAFQpN0ExDzFricPr1kLTfnv_ZAXq'
  end

else

  Recaptcha.configure do |config|
    config.public_key  = '6Lfai_sSAAAAAJJ0PuyHMuoeLEPK5iHqgA1y8Azp'
    config.private_key = '6Lfai_sSAAAAAG7VSB3yjQPlF1b80lzeIcM90JRw'
  end

end


