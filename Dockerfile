FROM node:8.9.1

# Set Up 'mongodb-tools'
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.4 main" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-get update -qqy

# Install required tools
RUN apt-get install -qqy \
  mongodb-org-tools \
  awscli \
  ruby \
  ruby-dev \
  rubygems-integration \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Set Up Heroku Deployer
RUN gem install dpl
