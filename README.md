# README

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :buyers


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| explanation        | text       | null: false                    |
| category           | references | null: false, foreign_key: true |
| status             | references | null: false, foreign_key: true |
| shipping_charge    | references | null: false, foreign_key: true |
| area               | references | null: false, foreign_key: true |
| shipping_day       | references | null: false, foreign_key: true |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to       :category
- belongs_to       :status
- belongs_to       :shipping_charge
- belongs_to       :area
- belongs_to       :shipping_day
- belongs_to       :user
- has_one          :buyer


## buyers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address


## shipping_addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | integer    | null: false                    |
| area               | references | null: false, foreign_key: true |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone              | integer    | null: false                    |
| buyer              | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer