# Steps to setup up new rails project with RSPect

- rails new <project-name> -T
- In Gemfile ->  gem 'rspec-rails'
- bundle
- rails g rspec:install

- Create a user model
  - rails g model user first_name:string last_name:string email:string active:boolean

- Create rspec model
  rails g rspec:model user 