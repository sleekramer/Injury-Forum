# Injury Forum

## Purpose

There are a plethora of diagnostic and informative medical websites and applications, but there is no place for patients to share their experiences with treatment and recovery. Injury Forum provides such a space.  Users are able to share their stories about recovery, as well as their treatment plans and methods in order to provide a first or second opinion to fellow patients, who often are subscribed a single option for recovery.

Injury Forum was built end-to-end by Steven Lee-Kramer.

## Summary

This application is built using Ruby on Rails version 4.2.4 with Ruby 2.2.4, and PostgreSQL.  For ease of development, I utilized Twitter Bootstrap to assist with layouts and Haml for templating.

If you would like to see the app in action, please checkout the [demo](https://injury-forum.herokuapp.com).


## Setup

Please feel free to clone the repo and test it out locally.  Again, this will require that you have Ruby 2.2.4, Rails 4.2.4, and PostgreSQL installed locally.  Once cloned, run these command from your command line:

```
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

That will create a local Postgres instance for the application, migrate the rails models into the database, and seed data used for portions of the application. That completes all the setup.  Try it out locally by running:

`$ rails server`

Navigate to the port indicated in your favorite browser.

## Additional Info

Please find a case study for this application in [my portfolio](sleekramer.github.io/portfolio/injuryforum).
