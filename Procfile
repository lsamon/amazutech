web: bundle exec rake assets:clean RAILS_ENV=production && bundle exec rake assets:precompile RAILS_ENV=production && bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -q default -q amazutech_mailers -e production
