# frozen_string_literal: true

Hcaptcha.configure do |config|
  config.site_key = ENV["hcaptcha"]["site_key"]
  config.secret_key = ENV["hcaptcha"]["site_secret"]
end
