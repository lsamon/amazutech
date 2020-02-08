# frozen_string_literal: true

return unless Rails.env.production?

require 'uri'
uri = URI(ENV['REDISTOGO_URL'])
REDIS = Redis.new(host: uri.host, port: uri.port, password: uri.password)
