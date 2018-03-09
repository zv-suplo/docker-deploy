FROM scardon/ruby-node-alpine:2.4.2

# Install required tools
RUN apk --update add mongodb-tools
RUN apk --update add aws-cli --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

# Set Up Heroku Deployer
RUN gem install dpl
