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
自分の記録を残すし、自分の客観的データを時系列で見ることで、自分の今の分析ができ、未来のヘルスケアに役立てます。

 - ヘルペスができたのはいつ？ストレスがあった時期？
 - 体脂肪率を絞ったのはいつ？ジムにどのくらい通った？
 - 歯科検診は定期的に1回通っている。前回通ったのはいつ？
 - 幼少期にHPVワクチンは打った？

など、自分の体なのに、時期と身体のデータが一致しません。
それを解決するのがHealthCode。
ゆくゆくは、自分の子供の管理、ある一定の年齢が来たらそのデータを本人へ返す。
本人がそのデータを用いて、自分の身体を管理する。
そんな循環ができたらと考え、その足掛かりになればいいなと思います。

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
