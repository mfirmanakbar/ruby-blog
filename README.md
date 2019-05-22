# README

My Demo Link: https://beta-blog-firman.herokuapp.com

How to deploy:

* Add config-prod in Gemfile
```
group :production do
gem 'pg' # it's for postgress on production
end
```

* Move SQLite in Gemfile, from global into development-test `gem 'sqlite3'`

* Open database.yml change production to using postgress
```
production:
adapter: postgresql
database: my_database_production
pool: 5
timeout: 5000
```

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

* if you got an application error exec this `to open irb database console`
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
```
add_column :articles, :description, :text # table : column : column type
add_column :articles, :created_at, :datetime
add_column :articles, :updated_at, :datetime
```

* update schema.rb
> rails db:migrate

* now we create Model `app\models\article.rb`
```
class Article < ApplicationRecord  
end
```

* we going to Create and Read record for database with rails console
`info: to open console`
> rails console

`this name of article.rb will show query select "articles".* from "articles"`
> Article.all

`to make var = model, to storing data`
> article = Article.new

`to storing article title`
> article.title = "this is my first article"

`to storing article description`
> article.description = "this is my first article's description"

`to show record in model var`
> article

`to save into database`
> artivle.save

```
INSERT INTO "articles" ("title", "description", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["title", "this is my first article"], ["description", "this is my first article's description"], ["created_at", "2019-05-19 00:12:25.061288"], ["updated_at", "2019-05-19 00:12:25.061288"]]
```

`show record`
> Article.all

```
Article Load (0.3ms)  SELECT  "articles".* FROM "articles" LIMIT ?  [["LIMIT", 11]]
=> #<ActiveRecord::Relation [#<Article id: 1, title: "this is my first article", description: "this is my first article's description", created_at: "2019-05-19 00:12:25", updated_at: "2019-05-19 00:12:25">]>
```

> article = Article.new(title: "my 2nd title", description: "my 2nd description") `we can also do this`

* how to Find and Update record
> article = Article.find(2)
> article.title = "my 2nd title edited"
> article.save

```
Article Update (2.4ms)  UPDATE "articles" SET "title" = ?, "updated_at" = ? WHERE "articles"."id" = ?  [["title", "my 2nd title edited"], ["updated_at", "2019-05-19 01:22:45.623705"], ["id", 2]]
```

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

* Add articles routes.rb
`resources :articles # this one for POST GET to CRUD`
> rails routes `to see list of routes`



The following must be execute after Create Module / update Schema when deploy production:

* For first time don't forget Create a Database first in heroku
  - Inside the newly created app, switch to Resources tab.
  - Under Add-ons, search for Heroku Postgres and then select from the suggested list.
  - In the popup shown, select free Hobby Dev - Free plan, click Provision.
  - Click on the just added database (Heroku Postgres :: Database).
  - Scroll towards the bottom of the page and click on View Credentials button (In Tab Setting ). You will see the database  credentials you will need to use when connecting to this database from API Express.

* after that update our database.yml
```
adapter: postgresql
database: secret-secret-
username: secret-secret-secret
password: secret-secret-secret-secret-secret-secret-secret-secret
pool: 5
timeout: 5000
```

* then commit and push to github

* Run
> heroku login
> git push heroku master

`to create any table that we have done in development`
> heroku run rails db:migrate
> heroku open



Setup Bootstrap CSS

* go to https://github.com/twbs/bootstrap-sass

* you will see this script and `gem 'bootstrap-sass', '~> 3.4.1'` copy paste it into GEMFILE.  
* Above the `gem 'sass-rails'` and After that run
> bundle install --without production

* create file assets/stylesheets/custome.css.scss and add this
```
@import "bootstrap-sprockets";
@import "bootstrap";
```

* open assets/javascripts/application.js add this as sequential
```
// require jquery
//= require rails-ujs
//= require bootstrap-sprockets
```


## How to create branch in github with TortoiseGit

* Right-Click in `D:\ror\ruby-blog` then `TortoiseGit` --> `Create Branch`
* Fill up the branch name example `Underdevelopment-branch`
* Ensure choose Base On `Head(Master)`
* Then Right-Click in `D:\ror\ruby-blog` then `TortoiseGit` --> `Swich/CheckOut`
* Choose the branch
