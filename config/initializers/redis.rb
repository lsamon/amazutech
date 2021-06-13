# frozen_string_literal: true

Redis.current = Redis.new(
  url: ENV['redis_url'],
  port: ENV['redis_port'],
  db: ENV['redis_db']
)
