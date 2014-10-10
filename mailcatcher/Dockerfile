FROM ruby:2.1.3

RUN gem install mailcatcher
RUN gem install i18n -v 0.6.11 && gem uninstall i18n -v 0.7.0.beta1

EXPOSE 1025 1080

CMD ["mailcatcher", "--ip", "0.0.0.0", "-f"]
