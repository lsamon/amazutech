# frozen_string_literal: true

require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV["redis_url"],
    namespace: ENV["app_name"]
  }
end
