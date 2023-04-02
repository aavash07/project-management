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
  * 'type' field in 'project' model was renamed to 'project_type' as type was column name reserved by Active Record


- Steps to run server
* run these commands: 
  * bundle install
  * rails db:create
  * rails db:migrate
  * rails serve
  
# NOTE: All tasks are not complete:
- unable to complete RSPEC
- unable to test dockerize due to hardware limitation of RAM
