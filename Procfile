web: bundle exec rake assets:clean RAILS_ENV=production && bundle exec rake assets:precompile RAILS_ENV=production && bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -c ${SIDEKIQ_CONCURRENCY:-5} -i ${DYNO:-1} -e production
