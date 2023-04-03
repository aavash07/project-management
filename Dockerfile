FROM ruby:3.1.3
ADD . /docker_image
WORKDIR /docker_image
RUN bundle install


ENV RAILS_ENV development
ENV RAILS_SERVE_STATIC_FILES true

EXPOSE 3000
CMD ["bash"]