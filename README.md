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
| birthday_year      | integer | null: false               |
| birthday_month     | integer | null: false               |
| birthday_day       | integer | null: false               |

### Association

- has_many :items
- has_many :buyers


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | references | null: false                    |
| status_id          | references | null: false                    |
| shipping_charge_id | references | null: false                    |
| area_id            | references | null: false                    |
| shipping_day_id    | references | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| buyer_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buyer
- belongs_to :category
- belongs_to :status
- belongs_to :shipping_charge
- belongs_to :area
- belongs_to :shipping_day


## categories テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| category           | string     | null: false                    |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :item


## statuses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| status             | string     | null: false                    |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :item


## shipping_charges テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| shipping_charge    | string     | null: false                    |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :item


## areas テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| area               | string     | null: false                     |
| item_id            | references | null: false, foreign_key: true  |
| buyer_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :buyer


## shipping_days テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| shipping_day       | string     | null: false                    |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :item


## buyers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | integer    | null: false                    |
| area_id            | references | null: false, foreign_key: true |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :area
- belongs_to :user
- belongs_to :item
