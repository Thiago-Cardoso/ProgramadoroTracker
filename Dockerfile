FROM ruby:2.5.1-slim
# install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev chromium-driver
# set path
ENV INSTALL_PATH /ProgramadoroTracker
# create repository
RUN mkdir -p $INSTALL_PATH
# set path with principal directory
WORKDIR $INSTALL_PATH
# copy gem inside the container
COPY Gemfile ./
# set path for gems
ENV BUNDLE_PATH /box
# copy code inside the container
COPY . .