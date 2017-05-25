# README

### Initial setup steps after git-clone

* use ruby version 2.2.2

* `cd team_work`

* `cp ./config/database.yml.example ./config/database.yml` and write down proper DB credentials for your db

* `gem install bundler` - install bundler gem

* `bundle install` - install all gems

* install and start Redis using next tutorial: http://redis.io/download (as addition you can specify path to Redis in "~/.profile" file)

* `rake db:create` - create database

* `rake db:migrate` - run migration

* `rake db:seed` - seed DB

* `rake secret` - generate secret key and insert it to `./config/secrets.yml`

* `foreman start` - start server

* open next page in Chrome browser: http://test.localhost:3000/
