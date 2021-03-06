# Steps to setup up new rails project with RSpec

- rails new <project-name> -T
- In Gemfile ->  gem 'rspec-rails'
- bundle
- rails g rspec:install

- Create a user model
  - rails g model user first_name:string last_name:string email:string active:boolean

- Create rspec model
  rails g rspec:model user 

- Create rspec for controler
  rails g rspec:request users

- Guard
   gem 'guard-rspec', require: false
   bundle exec guard init rspec

   bundle exec guard # to run the watcher

- Add code coverage
  gem 'simplecov', require: false, group: :test

  In spec_helper.rb add
    - require 'simplecov'
    - SimpleCov.start

- Install FactoryBot
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  gem 'factory_bot_rails'

  Update rails_helper.rb
  - # require 'support/factory_bot'

# The below code will automatically     
   # require factory_bot
   Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f}

# Create a support folder in the specs for
  - factories (and create your factories here)
    - users.rb  (factory)


