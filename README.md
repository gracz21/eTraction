# eTraction

[![Build Status](https://travis-ci.org/gracz21/eTraction.svg?branch=master)](https://travis-ci.org/gracz21/eTraction)

## Introduction

This is a repository of Ruby on Rails based backend for eTraction mobile app. eTraction is an application for people traveling by train which gives them more information and some entertainment during travel.

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](http://git-scm.com/)
* [Ruby](https://www.ruby-lang.org/pl/documentation/installation/) (version >= 2.4)
* [Ruby on Rails](http://rubyonrails.org/download/) (version >= 5.0)
* [PostgreSQL](http://www.postgresql.org/download/)
* [Heroku CLI](https://devcenter.heroku.com/articles/heroku-command/) (for administrating purpose)

## Installation

* `git clone https://github.com/gracz21/eTraction.git`
* change into the new directory
* make sure the user you've listed in `database.yml` is created for postgres, e.g. : `createuser -s -r user` for user named user
* `bundle install` to install dependencies
* `rake db:setup` to prepare and seed database

## Running / Development

Server used in development as well as production is [Puma](https://github.com/puma/puma).

* `rails server`
* visit your app at [http://localhost:3000](http://localhost:3000)

## Running Tests

* `rspec` to run all tests
* `rspec path_to_specific_test_file` to run specified test

## Further instruction

After each remote repo change follow this steps.

* `git pull`
* `bundle install`
* `rake db:migrate`