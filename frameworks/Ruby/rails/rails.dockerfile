FROM ruby:2.7

ADD ./ /rails

WORKDIR /rails

RUN bundle install --jobs=4 --gemfile=/rails/Gemfile --path=/rails/rails/bundle --without postgresql

CMD DB_HOST=tfb-database bundle exec puma -C config/mri_puma.rb -b tcp://0.0.0.0:8080 -e production_mysql
