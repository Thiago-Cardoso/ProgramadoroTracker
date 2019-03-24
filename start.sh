# install gems
bundle check || bundle install
# running server
bundle exec puma -C config/puma.rb
