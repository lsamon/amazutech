FROM alpine:3.7

#### app directory setup ####
# - Set location of app
# - Create app location
# - Set working directory to app location
ENV APP_HOME=/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Install Gems
COPY Gemfile* $APP_HOME/
RUN bundle install --jobs 4 --retry 3

# Copy source code to image
COPY . $APP_HOME/

RUN \
  mkdir -p \
    $APP_HOME/log \
    $APP_HOME/tmp/pids \
    $APP_HOME/tmp/sockets
