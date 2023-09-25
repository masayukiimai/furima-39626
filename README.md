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

-ColumnTypeOptions


| Column           | Type   | Options                              |
user      
| email            | string | null: false, unique: true            |
| first_name       | string | null: false                          |
| last_name        | string | null: false                          |
| first_name_kana  | string | null: false                          |
| last_name_kana   | string | null: false                          |
| date_of_birth    | date   | null: false                          |
| encrypted_password | string | null: false                        |
| nickname         | string | null: false                          
has_many :items
has_many :purchase_records

| Column           | Type        | Options                               |
item
| name             | string      | null: false                           |
| description      | text        | null: false                           |
| category_id      | integer     | null: false                           |
| condition_id     | integer     | null: false                           |
| postage_payer_id | integer     | null: false                           |
| prefecture_id    | integer     | null: false                           |
| handling_time_id | integer     | null: false                           |
| price            | integer     | null: false                           |
| user             | references  | null: false, foreign_key: true         |
belongs_to :user
has_one :purchase_record

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
purchase_records
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
- belongs_to :user
- belongs_to :item


| Column         | Type       | Options                        |
shipping_addresses
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchase_record| references | null: false, foreign_key: true |
belongs_to :purchase_record