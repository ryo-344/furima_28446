# テーブル設計

## users テーブル

| Column                | Type   | Option      | 
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| mail                  | string | null: false |
| password              | string | null: false |
| password-confirmation | string | null: false |
| last-name             | string | null: false |
| first-name            | string | null: false |
| last-name             | string | null: false |
| first-name            | string | null: false |
| birth-year            | string | null: false |
| birth-month           | string | null: false |
| birth-day             | string | null: false |

### Association

- has_many :items
- has_many :purchases
- has_many :shippings

## items テーブル

| Column      | Type       | Option                         |
| ------------| ---------- | -------------------------------|    
| image       | string     | null: false                    |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| price       | integer    | null: false                    |
| nickname        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- has_on :shipping

## purchases テーブル

| Column           | Type    | Option                         |
| ---------------- | ------- | ------------------------------ |
| cardnumber      | integer | null: false                    |
| expiration-month | integer | null: false                    |
| expiration-year  | integer | null: false                    |
| securitycode    | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |
| item_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippings テーブル

| Column|          | Type    | Option                         |
| ---------------- | ------- | ------------------------------ |
| postcode         | integer | null: false                    |
| city             | string  | null: false                    |
| number           | string  | null: false                    |
| building         | string  | null: false                    |
| telephonenumber | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |
| item_id          | integer | null: false, foreign_key: true |
| purchase_id      | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase