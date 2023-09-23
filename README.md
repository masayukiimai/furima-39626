# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

|Column|Type|Options|
email	string	null: false, unique: true
password	string	null: false
nickname	string	null: false

Column	Type	Options
name	string	null: false
description	text	null: false
price	integer	null: false
user	references	null: false, foreign_key: true


Column	Type	Options
user	references	null: false, foreign_key: true
item	references	null: false, foreign_key: true

Column	Type	Options
postal_code	string	null: false
prefecture	string	null: false
city	string	null: false
purchase_record	references	null: false, foreign_key: true

