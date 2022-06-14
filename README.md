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
# テーブル設計

## users テーブル

| Column                  | Type   | Options                   |
| ----------------------- | ------ | ------------------------- |
| nickname                | string | null: false,              |
| email                   | string | null: false, unique: true |
| encrypted_password      | string | null: false               |
| last-name               | string | null: false               |
| first-name              | string | null: false               |
| last-name-kana          | string | null: false               |
| first-name-kana         | string | null: false               |
| birth-date              | string | null: false               |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column                     | Type       | Options                       |
| ---------------------------| ---------- | ----------------------------- |
| item-name                  | string     | null: false                   |
| item-info                  | text       | null: false                   |
| item-category_id           | integer    | null: false                   |
| item-sales-status_id       | integer    | null: false                   |
| item-shipping-fee-status_id| integer    | null: false                   |
| item-prefecture_id         | integer    | null: false                   |
| item-scheduled-delivery_id | integer    | null: false                   |
| item-price                 | string     | null: false                   |
| user                       | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| post-code          | string     | null: false, maxlength: 8      |
| item-prefecture_id | integer    | null: false,                   |
| city               | string     | null: false,                   |
| addresses          | string     | null: false,                   |
| building           | string     |                                |
| phone-number       | string     | null: false, maxlength: 11     |
| order              | references | null: false, foreign_key: true |

### Association
- belongs_to :order