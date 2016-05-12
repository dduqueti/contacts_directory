# Contacts Directory
Share your contacts and meet new people!

In Contacts Directory you can add and delete contacts and receive notifications when others do the same!

# Delivery Date

* 11-May-2016

# Versions

* Ruby: 2.2.0-p0
* Rails: 4.2.4

# Dependencies

Contacts Directory uses:

* MySQL Database
* Redis (3.3.0) (install with homebrew using  `brew install redis`)
* MailCatcher (0.6.4) for local mail catching (install with `gem install mailcatcher`) 


# Heroku

You can access this application on it's heroku site `http://contacts-directory.herokuapp.com/`
# Local Setup

Prepare the project and create some seed records with:

1. Clone the repository.
2. `bundle install` on app directory.
3. `bundle exec rake db:create` on app directory.
4. `bundle exec rake db:migrate` on app directory.
5. `bundle exec rake db:seed` on app directory.

To run test, prepare test database and execute with:

1. `bundle exec rake db:create RAILS_ENV=test` on app directory.
2. `bundle exec rake db:test:prepare` on app directory.
3. `bundle exec rake test` on app directory.

# Usage

Open a command line terminal for each of the following items and execute the instruction:

1. Start Redis server with `redis-server` (will start on to `localhost:6379` by default).
2. Start MailCatcher with `mailcatcher` (will start on to `localhost:1080` by default).
3. Start Resque background queue that will handle email notifications delivery with `QUEUE=* rake environment resque:work`.
4. Start Rails server with on app directory `rails s` (will start on `localhost:3000` by default).

Go to `localhost:3000` to start using the app!
