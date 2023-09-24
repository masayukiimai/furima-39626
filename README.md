|Column|Type|Options|
email	string	null: false, unique: true
password	string	null: false
nickname	string	null: false

has_many :items
has_many :purchase_records

Column	Type	Options
name	string	null: false
description	text	null: false
price	integer	null: false
user	references	null: false, foreign_key: true

belongs_to :user
has_one :purchase_record


Column	Type	Options
user	references	null: false, foreign_key: true
item	references	null: false, foreign_key: true

belongs_to :user
belongs_to :item
has_one :shipping_address



Column	Type	Options
postal_code	string	null: false
prefecture	string	null: false
city	string	null: false
purchase_record	references	null: false, foreign_key: true

belongs_to :purchase_record
