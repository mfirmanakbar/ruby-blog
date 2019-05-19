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

* To add your SSH key to your heroku account so you don't have to use username and password everytime ->
> heroku keys:add

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

* to open restart and open
> heroku restart
> heroku open



Start to Database Operation:

* Create (db/migrate)
> rails generate migration create_articles

* then Add `t.string :title`

* Run:
> rails db:migrate

* When we want add new column. this script to drop table and will gone from schema.rb
> rails db:rollback

* add column `t.text :description` in db/migrate/x_create_articles.rb then run this again to generate the schema.rb
> rails db:migrate

* next step we wan't using desc first
> rails db:rollback

* delete `t.text :description` in db/migrate/x_create_articles.rb

* update schema.rb
> rails db:migrate

* we add description column with another way, using new migration file
> rails generate migration add_description_to_articles

* add this scripts to the db/migrate/x_add_description_to_articles.rb
`add_column :articles, :description, :text # table : column : column type
add_column :articles, :created_at, :datetime
add_column :articles, :updated_at, :datetime`

* update schema.rb
> rails db:migrate

* now we create Model `app\models\article.rb`
`class Article < ApplicationRecord  
end`

* we going to Create and Read record for database with rails console
> rails console `info: to open console`
> Article.all `this name of article.rb will show query select "articles".* from "articles"`
> article = Article.new `to make var = model, to storing data`
> article.title = "this is my first article" `to storing article title`
> article.description = "this is my first article's description" `to storing article description`
> article `to show record in model var`
> artivle.save `to save into database`

`INSERT INTO "articles" ("title", "description", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["title", "this is my first article"], ["description", "this is my first article's description"], ["created_at", "2019-05-19 00:12:25.061288"], ["updated_at", "2019-05-19 00:12:25.061288"]]`

> Article.all `show record`

`Article Load (0.3ms)  SELECT  "articles".* FROM "articles" LIMIT ?  [["LIMIT", 11]]
=> #<ActiveRecord::Relation [#<Article id: 1, title: "this is my first article", description: "this is my first article's description", created_at: "2019-05-19 00:12:25", updated_at: "2019-05-19 00:12:25">]>`

> article = Article.new(title: "my 2nd title", description: "my 2nd description") `we can also do this`

* how to Find and Update eecord
> article = Article.find(2)
> article.title = "my 2nd title edited"
> article.save
`Article Update (2.4ms)  UPDATE "articles" SET "title" = ?, "updated_at" = ? WHERE "articles"."id" = ?  [["title", "my 2nd title edited"], ["updated_at", "2019-05-19 01:22:45.623705"], ["id", 2]]`

* how to Delete record
> article = Article.find(2)
> article.destroy
`Article Destroy (1.8ms)  DELETE FROM "articles" WHERE "articles"."id" = ?  [["id", 2]]`

* Add Validation in models (article.rb)
`validates :title, presence: true, length: { minumum: 3, maximum: 50 }`

* After update Model we need to reload console
> reload!
> exit
> rails console

* To find out error message in model console
> article.errors.any?
> article.errors.full_messages
