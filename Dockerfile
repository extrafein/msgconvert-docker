# Use Alpine Linux as the base image
FROM alpine:latest

# Set the working directory
WORKDIR /messages

# Install required packages
RUN apk update && \
    apk add --no-cache wget perl perl-mail-tools

# Install msgconvert using cpan
RUN wget https://github.com/mvz/email-outlook-message-perl/raw/master/msgconvert && \
    chmod +x msgconvert && \
    mv msgconvert /usr/local/bin/msgconvert

# Clean up unnecessary files and packages
RUN apk del wget

# Set the entry point
ENTRYPOINT ["msgconvert"]
