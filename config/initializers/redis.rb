# frozen_string_literal: true

Redis.current = Redis.new(
  url: Figaro.env.redis_url,
  port: Figaro.env.redis_port,
  db: Figaro.env.redis_db
)
