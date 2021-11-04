# README

A experiment to learn some basic concepts of rails.

## Failures:
  * There is one major design flaw, namely that likes are coupled to tweets in both controllers and views. 
    That should (but probably won't) be changed.
  * Tailwind styles are very poorly organized and that led to a lot of unnecessary duplication.

Relevant info:

* Ruby version: 3.0.0 since Github Actions do not support versions above that

* Configuration: No configuration needed (I believe!)

* Database: Postgres (heroku doesn't permits SQL)

* Database initialization: rails db:create db:migrate db:seed

* How to run the test suite: rails test

* Deployment instructions: deployments are automatic on any push to main/develop (todo: separate qa from prod)
