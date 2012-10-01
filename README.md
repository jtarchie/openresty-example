# Introduction

An example application for the [OpenResty Heroku Bundle](https://github.com/jtarchie/heroku-buildpack-openresty).

# Usage

From the command line.

    gem install heroku
    heroku create --stack cedar --buildpack https://github.com/jtarchie/heroku-buildpack-openresty.git
    heroku pg:psql
    > CREATE TABLE venues ( name TEXT );
    > INSERT INTO venues (name) VALUES ('venue1');
    > \q
    git push heroku master
    heroku open