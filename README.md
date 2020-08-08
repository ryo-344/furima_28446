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
| birthday              | date   | null: false |

### Association

- has_many :items

## items テーブル

| Column      | Type       | Option                         |
| ------------| ---------- | -------------------------------|    
| image       | string     | null: false                    |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | string     | null: false                    |
| status      | string     | null: false                    |
| burden      | string     | null: false                    |
| days        | string     | null: false                    |
| price       | integer    | null: false                    |
| nickname    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_on :shipping


## shippings テーブル

| Column|         | Type    | Option                         |
| --------------- | ------- | ------------------------------ |
| postcode        | string  | null: false                    |
| city            | string  | null: false                    |
| number          | string  | null: false                    |
| building        | string  | null: false                    |
| telephonenumber | string  | null: false                    |
| item_id         | integer | null: false, foreign_key: true |

### Association

- belongs_to :item
