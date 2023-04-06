# README

This README documents whatever steps are necessary to get the
application up and running.

- Additional Gems used

  * jwt for token validation
  * ruby-enum for enum helper
  * jbulder for serializing objects
  * rubocop for syntax and formatting code
  * rspec for unit testing
  * shoulda-matchers for one-liners to test common Rails functionality
  * faker a library for generating fake data
- API modification

  * None
- Steps to run server

  Prerequisites:

  - ruby version 3.1.3
  - rails version 7.0.4

* run these commands:
  - install gems
  
  ```
  bundle install
  ```
  
  - create and migrate DB
  
  ```
  rails db:create
  ```
  
  ```
  rails db:migrate
  ```
  
  - start rails server
  
  ```
  rails serve
  ```

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
