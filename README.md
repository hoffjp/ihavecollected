# I Have Collected (dot) com

Generally, I like the idea of building a solid API where the front-end is irrelevant (or can be replaced).  Recently, I have been reading a lot about Ember.js and would like to try creating a client with that framework.
But, initially, let's get a fundamental Rails application erected.

### Naming Conventions

The set of data should be a 'Collection' and each user can have many.
Within the 'Collection' there will be only data items and field labels (the exact name to be determined)

For testing and development it is important to generate some "seed data" (in db/seeds.rb).  This will define the architecture.

### Routes

I would like to see something like `asimov.books.ihavecollected.com` will yield a list of `{type: 'asimov', category: 'books}`.
Also, something like `books.ihavecollected.com` should return a high-level list of all collections (title only?) that fit `{category: 'books'}`.

Users - who need to have an account on the system - should be able to create a new 'Collection'.  This requires, of course, a form with (at a minimum):
 - Collection Name
 - Category (choose from a list) *maybe in the future one that is NOT on the list could be 'proposed' by the user*
 - List of the "Field Names"
 - make it clear to the user what is the maximum [12 maybe?]

Another form must be available to **enter** data in the collection

There must be an 'update' action to Add/Delete items from a collection

### Data Models

I think the 'categories' should be pre-defined and the user required to choose one to which his 'collection' belongs.
A model must be created for the 'Collections'.
A standard 'User' model is also required.
A user should be able to mark a collection as 'Public' or 'Private' and I expect only one marked 'Public' can be reached directly, via REST URL, without being logged in as **that** user.

## Behavior Driven Development

I want to stretch and exercise my curent TDD skills.  In this case we will be performing (what is more appropriately called) Behavior Driven Development because the tests will reflect the expected 'behavior' of the application.  One of the real challenges in writing tests first is to avoid the tempation of "testing implementation details".  As a coder, I think like a coder.  I need to step-back and think in a much more abstract way - defining behavior(s).

The tests will be designed to fail until the appropriate behavior is built into the application.  When writing the code you should avoid the OTHER temptation to write concise and clever code.  Be sure to restrict yourself to JUST ENOUGH TO PASS THE TEST.  There is an additional step that involves refactoring the code.  With the safety-net of the tests you are free to be a bit bolder in your refactoring.

---

### Notes

I initiated the application with this command

```
rails new ihavecollected -T -d postgresql
```

Edited the Gemfile as follows:

```yaml
source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'therubyracer'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc

#gem 'spring',        group: :development

# Use ActiveModel has_secure_password
 gem 'bcrypt', '~> 3.1.7'

### --- Testomg ---
### Install/activate RSpec with
###    rails generate rspec:install && rspec spec --format documentation
group :test do
  gem 'rspec-rails'
  gem 'capybara'
end

###-------- Jake Favorite gems -------------
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'simple_form'
###--------------------------------------

```

Edit the `database.yml` file.

And then `bundle`

---


Last updated May 2016
