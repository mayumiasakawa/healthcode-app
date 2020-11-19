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
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| allergies    | string     |                                |
| alcohol      | string     |                                |
| cigarette    | string     |                                |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :overviews
- has_one :physicalfindings
- has_one :vaccine
- has_one :medicalhistories


## physicalfindings テーブル
| Column                  | Type     | Options      |
| ----------------------- | -------- | ------------ |
| year                    | integer  | null: false  |
| month                   | integer  | null: false  |
| date                    | integer  | null: false  |
| weight                  | integer  |              |
| height                   | integer |              |
| abdominal_circumference | integer  |              |

### Association
- belongs_to :overviews

## bloodsampling テーブル
| Column                  | Type     | Options      |
| ----------------------- | -------- | ------------ |
| year                    | integer  | null: false  |
| month                   | integer  | null: false  |
| date                    | integer  | null: false  |

### Association
belongs_to :overviews

## vaccines テーブル
| Column                  | Type     | Options      |
| ----------------------- | -------- | ------------ |
| year                    | integer  | null: false  |
| month                   | integer  | null: false  |
| date                    | integer  | null: false  |
| type                    | string   | null: false  |

### Association
belongs_to :overviews

## medicalhistories テーブル
| Column                  | Type     | Options      |
| ----------------------- | -------- | ------------ |
| year                    | integer  | null: false  |
| month                   | integer  | null: false  |
| date                    | integer  | null: false  |
| clinic_name             | string   | null: false  |
| department              | string   | null: false  |
| medicine                | string   |              |

### Association
belongs_to :overviews

