web: bundle exec puma -C "config/puma.rb"
worker: bundle exec sidekiq start -C config/sidekiq.yml
release: bundle exec rake db:migrate
