if Rails.env.production?
  Sidekiq.configure_client do |config|
    config.redis = { url: ENV["REDIS_URL"], namespace: :resque }
  end

  Sidekiq.configure_server do |config|
    config.redis = { url: ENV["REDIS_URL"], namespace: :resque }
    config.reliable_fetch!

    database_url = ENV['DATABASE_URL']
    if database_url
      ENV['DATABASE_URL'] = "#{database_url}?pool=250"
      ActiveRecord::Base.establish_connection
    end

    $elastic = Elasticsearch::Client.new
    Stretchy.client = $elastic
  end
else
  Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379/0', namespace: "simplesettler_sidekiq_#{Rails.env}" }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://localhost:6379/0', namespace: "simplesettler_sidekiq_#{Rails.env}" }
  end
end
