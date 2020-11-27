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

## users テーブル
| Column                | Type    | Options      |
| --------------------- | ------- | ------------ |
| first_name            | string  | null: false  |
| last_name             | string  | null: false  |
| first_name_kana       | string  | null: false  |
| last_name_kana        | string  | null: false  |
| birthday              | date    | null: false  |
| email                 | string  | null: false  |
| password_confirmation | string  | null: false  | 

### Association
- has_one :overviews

## overviews テーブル
| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| user                    | references | null: false, foreign_key: true |
| measuring_date          | date       | null: false                    |
| weight                  | integer    | null: false ,if:->{}           |
| height                  | integer    | null: false ,if:->{}           |
| abdominal_circumference | integer    | null: false ,if:->{}           |
| bloodsampling           | img        | null: false ,if:->{}           |
| vaccines_type           | string     | null: false ,if:->{}           | 
| medicine                | string     | null: false ,if:->{}           |
| department              | string     | null: false ,if:->{}           |
| clinic_name             | string     | null: false ,if:->{}           |

### Association
- belongs_to :user
