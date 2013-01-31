# About

Heroku CLI plugin for Treasure Data Cloud.

# Install

    # create heroku app
    $ heroku create --stack cedar

    # add TD addon
    $ heroku addons:add treasure-data

    # install TD toolbelt
    $ open http://toolbelt.treasure-data.com/

    # add plugin
    $ heroku plugins:install git://github.com/treasure-data/heroku-td.git

    # it's ready!
    $ heroku td tables

    # you can throw query like this
    $ heroku td query -w -d production_db "SELECT COUNT(1) FROM rails_access"

# See

* [Treasure Data Heroku Addon](https://devcenter.heroku.com/articles/treasure-data)
* [Using Heroku CLI Plugins](http://devcenter.heroku.com/articles/using-cli-plugins)
