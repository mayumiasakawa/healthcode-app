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

# Health Code
自分の身体の記録を残し、客観的データを見ることで、身体の分析ができ、未来のヘルスケアに役立てます。

# Description
 - 体脂肪率を絞ったのはいつ？ジムにどのくらい通った？
 - ヘルペスができたのはいつ？ストレスがあった時期？
 - 歯科検診は定期的に通っているけど、前回通ったのはいつ？
 - 幼少期にHPVワクチンは打った？

など、自分の身体なのに、過去の予定表を見ないと情報がわかりません。
それを解決するのがHealthCode。
本人がそのデータを用いて、自分の身体を管理するためのアプリケーション。
ゆくゆくは、自分の子供（ワクチン歴、病気の歴など）のデータの管理をし、ある一定の年齢が来たらそのデータを本人へ返す。
そんな循環を作るきっかけとなるアプリケーションです。

# Preview
<img width="1438" alt="スクリーンショット 2020-12-23 12 44 29" src="https://user-images.githubusercontent.com/63479656/102957052-cadfd680-451c-11eb-91c6-09ad1d7e971d.png">

# Demo
![gamen_test1](https://user-images.githubusercontent.com/63479656/102958891-55c2d000-4521-11eb-9c47-ac3eb5b9571e.gif)

# Usage

# Requirement
- Ruby On Rails 6.0.0
- MySQL
- jQuery
- Heroku

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
