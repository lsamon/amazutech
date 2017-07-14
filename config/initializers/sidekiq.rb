# if Rails.env.production?
#
#   Sidekiq.configure_client do |config|
#     config.redis = { url: ENV["REDISTOGO_URL"], namespace: :resque }
#   end
#
#   Sidekiq.configure_server do |config|
#     config.redis = { url: ENV["REDISTOGO_URL"], namespace: :resque }
#
#     database_url = ENV['DATABASE_URL']
#     if database_url
#       ENV['DATABASE_URL'] = "#{database_url}?pool=250"
#       ActiveRecord::Base.establish_connection
#     end
#   end
# else
#   Sidekiq.configure_server do |config|
#     config.redis = { url: 'redis://localhost:6379/0', namespace: "simplesettler_sidekiq_#{Rails.env}" }
#   end
#
#   Sidekiq.configure_client do |config|
#     config.redis = { url: 'redis://localhost:6379/0', namespace: "simplesettler_sidekiq_#{Rails.env}" }
#   end
# end
