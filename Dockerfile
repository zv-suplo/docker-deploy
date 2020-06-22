FROM node:12-buster

ENV MONGODB_VERSION 4.2
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE TRUE

# Import the public key used by the package management system
RUN wget -qO - https://www.mongodb.org/static/pgp/server-$MONGODB_VERSION.asc | apt-key add -

# Create the list file using the command appropriate for your version of Debian
RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/$MONGODB_VERSION main" | tee /etc/apt/sources.list.d/mongodb-org-$MONGODB_VERSION.list

# Reload local package database
RUN apt-get update -yq

# Install the MongoDB packages.
RUN apt-get install -y  --no-install-recommends \
  mongodb-org-tools

RUN echo "mongodb-org-tools hold" | dpkg --set-selections

# Install required tools
RUN apt-get install -y --no-install-recommends \
  awscli \
  ruby-dev \
  rubygems-integration

# Clean up package lists & caches
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Set Up Heroku Deployer
RUN gem install dpl