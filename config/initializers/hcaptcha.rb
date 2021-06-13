# frozen_string_literal: true

return unless Rails.env.production?

Hcaptcha.configure do |config|
  config.site_key = Figaro.env.hcaptcha.site_key
  config.secret_key = Figaro.env.hcaptcha.site_secret
end
