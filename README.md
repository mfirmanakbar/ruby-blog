# README

My Demo Link: https://beta-blog-firman.herokuapp.com

## Create and Run

> rails new ruby-blog
> cd ruby-blog
> rails server

* then open http://localhost:3000/

## How to deploy:

* Add config-prod in Gemfile
```
group :production do
gem 'pg' # it's for postgress on production
end
```

* Move SQLite in Gemfile, from global into development-test `gem 'sqlite3'`

* run 
> bundle



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


## Database Operation:

* Create (db/migrate)
> rails generate migration create_articles

* then Add `t.string :title`

* Run:
> rails db:migrate

* When we want add new column. this script to drop table and will gone from schema.rb
> rails db:rollback

* rollback is when we need to change existing file in `/db/migrate/fileName.rb`

* rollback doesn't apply to migration that we have created a new file
* then we don't need to run `rails db:rollback` just need to run `rails db:migrate`

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

`to check true or false. article nil or not`
> article.new_record?

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


## The following must be execute after Create Module / update Schema when deploy production:

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


## Setup Bootstrap CSS

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


## How to create local branch in github with TortoiseGit

* Right-Click in `D:\ror\ruby-blog` then `TortoiseGit` --> `Create Branch`
* Fill up the branch name example `Underdevelopment-branch`
* Ensure choose Base On `Head(Master)`
* Then Right-Click in `D:\ror\ruby-blog` then `TortoiseGit` --> `Swich/CheckOut`
* Choose the branch

## How to create remote branch in github with TortoiseGit

* Right-Click in `D:\ror\ruby-blog` then `TortoiseGit` --> `Settings`
* Click `Git --> Remote`
* Create new one and save it
```
remote: Underdevelopment-Branch
URL: https://github.com/mfirmanakbar/ruby-blog.git
Tags reachable
Prune
```

## How to commit with branching

* Just don't forget when commit and push please select Local and Remote `Underdevelopment-branch`
* Then we will merge to `master` soon maybe better in github page

## How to merge branch to Master
* Then Right-Click in `D:\ror\ruby-blog` then `TortoiseGit` --> `Swich/CheckOut`
* Choose Master (local not remote)
* TortoiseGit --> Merge
* Choose Branch Remotes/Underdevelopment-Branch/Underdevelopment-Branch
* Then Push it (no need commit/ commit already when we merged)
* to start coding again `Swich/CheckOut` choose Underdevelopment-Branch (local not remote)

## How to get first and last record limit 1
* open IRB with run `rails console`
> Article.first
> Article.last


## How to debug
* example we want to debug Article Controller in Create function
* just put `debugger` after line `def create` and comment out `# @art.user = User.first`
```
def create
  debugger
  @art = Article.new(article_params)
  # to find users limit 1. this is for us Hard code the user_id for articles table
  # @art.user = User.first
  if @art.save
    flash[:success] = "Article was successfully created"
    logModel(@art)
    redirect_to article_path(@art)
  else
    render 'new'
  end
end
```
* look at our terminal / cmd. by right should showing the log of debug
* we can call variable like `@art` which we already defined inside that controller
* type `params` to show all paramters
* type `n` then `ENTER` to go the next line of debug
* fot stop the debug just `CTRL + D` and it goes back to rails server


## How to create Hash Secure Password

* add `has_secure_password` in /app/models./user.rb
* create new migration `rails migration add_password_digest_to_users` then write this
```
class AddPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digest, :string
  end
end
```
* then run `rails db:migrate`
* how to use?
`if we save user.password = "password" `
`it will return has user.password = "$2a$10$EuSH7ctK1kXNuKPnO7MaGuXnfE1yrbntClRLVbUnsKp..."`
* how to testing Run
> user.authenticate("password")
`it will return true`


* Update boolean admin
> user = User.find(7)
> user.admin? `true`
> user.toggle!(:admin) `updated`


## How to Test apps

* in rails 5 i change this:
* comment out this becuase already deprecated `gem 'chromedriver-helper'`
* then add `gem 'webdrivers', '~> 3.0'`

* create migration to add category table `> rails generate migration add_categories`
```
class AddCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
  end
end

```
* then run `> rails db:migrate`

* create model in /app/models/category.rb

* create category_test.rb in /test/models/category_test.rb
```
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do
    asssert @category.valid?
  end

end
```

* run it with `> rails test`

* if got some error run this
> bundle exec rails db:migrate
> bundle exec rails db:test:prepare
