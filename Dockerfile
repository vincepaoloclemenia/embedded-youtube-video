# syntax=docker/dockerfile:1
FROM ruby:2.6.9
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /embedded-youtube-video
COPY Gemfile /embedded-youtube-video/Gemfile
COPY Gemfile.lock /embedded-youtube-video/Gemfile.lock
RUN gem install bundler --version '2.3.18'
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]