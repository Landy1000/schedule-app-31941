# README

# 概要
　予定を合わせる際に利用できる、複数人の空いている時間を合わせるアプリケーションを作成しました。ユーザー登録をしている人同士でルームを作成することができます、
ルームにはカレンダーが表示されており、いつ何人の予定が重複しているか表示されています。日付を選ぶとその日付の0時から24時まで一時間刻みのボタンがあり、ボタンを押すと自分の空いているスケジュールを一時間単位で登録することができます。また、ボタンの横には他のルームメイトの空いている時間が表示されており、重複している人数によって色が変わるようになっています。

# 制作背景
　コロナ禍でオンラインで物事を進めることが多くなり、移動時間を考慮する必要がなくなり、より細かい時間調整ができるアプリケーションの需要が高まるのではないかと考え、複数人の時間を合わせるアプリケーションを開発しました。
　似たようなサービスとして今まで私は友人と飲み会や遊ぶ日程を合わせる際にLINEのスケジュール機能を利用していました。しかし、日にちしか合わせることができず、また、日付と◎、△、×が並んでいるだけなので視覚的に分かりにくいと感じており、今回のアプリではそこを改善することを意識して開発しました。
　空いている時間の登録はスマホでも手軽にできるようにハイブリッドアプリ想定して、バックエンドをRuby On RailsのAPIモードで、フロントエンドはReactで作成しております。今後React Nativeを用いてネイティブアプリの開発を予定しています。


# 工夫したポイント
## RailsのAPIモードを使って実装している
## ユーザー認証にdevise-token-authを使用してトークン認証をしている
## フロントエンドにはReactを使っていて、SPAになっている
## Reactではreducksパターンを用いてストアを管理している。

# 開発環境
フロントエンド React
バックエンド Ruby on Rails

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## dates テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| date    | date       |                                |
| time    | integer    |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


