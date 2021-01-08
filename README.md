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
健康診断の結果や、病気を患ったときの歴、体重やBMIなどの管理ができます。
過去の自分を知ることで、未来の自分のヘルスケアをするために作りました。
また、このデータが病院受診時に医療側への手助けとなるアプリケーションになれればと思います。


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
- HEADER
データ登録、閲覧を選びます。
  - ブラウザ表示
![preview_header](https://user-images.githubusercontent.com/63479656/102960699-dc79ac00-4525-11eb-865c-87e95352bd9f.gif)
  - レスポンシブ表示
  スマートフォンが10代から40代のインターネット接続端末の80%（※）をシェアしている現状から、レスポンシブ対応の表示でも扱いやすいよう設定しました。
（※総務省「平成29年通信利用動向調査」（2018）より）
![preview_header_responsive](https://user-images.githubusercontent.com/63479656/102961158-fbc50900-4526-11eb-8af0-b9f5ac85d66b.gif)

 - Registration
データ登録・閲覧
各項目毎に表示され、時系列で見ることができます。
![registration](https://user-images.githubusercontent.com/63479656/103861192-5f8f2a80-5100-11eb-9e38-eef1e3881418.gif)

# Plan
- DB再設計
  - ネストを用いて再設計
- 受診歴
  - 診療科追加
  - 通院フォローの可否、通院間隔の登録・リマインダー
- 画像
  - タップし拡大表示


# Requirement
- Ruby On Rails 6.0.0
- MySQL
- jQuery
- Heroku

# DataBase
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
