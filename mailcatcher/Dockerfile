FROM ruby:2.1.3

RUN gem install mailcatcher

EXPOSE 1025 1080

CMD ["mailcatcher", "--ip", "0.0.0.0", "-f"]
