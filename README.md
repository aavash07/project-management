# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...

- Additional Gems used

  * jwt for token validation
  * ruby-enum for enum helper
  * jbulder for serializing objects
- API modification

  * None
- Steps to run server

  Prerequisites:

  - ruby version 3.1.3
  - rails version 7.0.4

* run these commands:
  * bundle install
  * rails db:create
  * rails db:migrate
  * rails serve

# For docker

- create docker image named docker_image using

  ```
  docker build -t docker_image .
  ```
- create and migrate db

  ```
  docker compose run web rake db:create
  ```

  ```
  docker compose run web rake db:migrate
  ```
- run docker compose using

  ```
  docker compose up
  ```

# NOTE: All tasks are not complete:

- unable to complete RSPEC
