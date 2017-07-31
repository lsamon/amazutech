require 'uri'
uri = URI(Figaro.env.redistogo_url)
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
