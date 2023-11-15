# Use Alpine Linux as the base image
FROM alpine:latest

# Set the working directory
WORKDIR /messages

# Install required packages
RUN apk update && \
    apk add --no-cache wget perl perl-mail-tools perl-mime-types perl-email-simple perl-email-messageid perl-email-mime-encodings perl-email-mime-contenttype perl-email-address-xs perl-email-simple-creator

# Install msgconvert using cpan
RUN wget https://raw.githubusercontent.com/mvz/email-outlook-message-perl/master/script/msgconvert && \
    chmod +x msgconvert && \
    mv msgconvert /usr/local/bin/msgconvert

# Install Email::Address and Email::MIME Perl modules
#RUN apk add --no-cache perl-app-cpanminus && \
#    cpanm Email::Address Email::MIME

# Clean up unnecessary files and packages
RUN apk del wget

# Set the entry point
ENTRYPOINT ["msgconvert"]
