# README

How to deploy:

* Add config-prod in Gemfile
  `group :production do
  gem 'pg' # it's for postgress on production
  end`

* Move SQLite in Gemfile, from global into development-test
  `gem 'sqlite3'`

* Open database.yml change production to using postgress
  `production:
  adapter: postgresql
  database: my_database_production
  pool: 5
  timeout: 5000`

* after change Gemfile don't forget exec this one
> bundle update

* then add, commit and pust to github

* intall heroku from https://devcenter.heroku.com/articles/heroku-cli and check installed
> heroku
> heroku --version

* Run this to deploy heroku (https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up)
> heroku login
> git push heroku master
> heroku open

* if you got an application error exec this
> heroku run rails console

* if you want to rename domain exec this (example: https://beta-blog-firman.herokuapp.com/)
> heroku rename beta-blog-firman
