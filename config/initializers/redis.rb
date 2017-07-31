require 'uri'
require 'byebug'

byebug
uri = URI(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
