# テーブル設計

## users テーブル

| Column                | Type   | Option                  | 
| --------------------- | ------ | -----------             |
| nickname              | string | null: false             |
| email                 | string | null: false, default: ""|
| encrypted_password    | string | null: false, default: ""|
| last-name             | string | null: false             |
| first-name            | string | null: false             |
| last-name             | string | null: false             |
| first-name            | string | null: false             |
| birthday              | date   | null: false             |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column         | Type       | Option                         |
| -------------- | ---------- | -------------------------------|    
| name           | string     | null: false                    |
| explanation    | text       | null: false                    |
| category       | integer    | null: false                    |
| status         | integer    | null: false                    |
| shippingorigin | integer    | null: false 
| burden         | integer    | null: false                    |
| days           | integer    | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- has_one :shipping

## purchase テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| postcode        | string     | null: false                    |
| city            | string     | null: false                    |
| number          | string     | null: false                    |
| building        | string     | null: false                    |
| telephonenumber | string     | null: false                    |
| item            | references | null: false, foreign_key: true |
| purchase        | references | null: false, foreign_key: true |
### Association

- belongs_to :item
- belongs_to :purchase
