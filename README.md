# README
## アプリケーション名
CAD Item

## アプリケーション概要
CADに関するツールや3Dモデルを投稿・共有することが可能です。Dynamo・Grasshopperなど作成できるビジュアルプログラムを売買・共有・受発注するwebサイトがなく、SNSの有志同士のコミュニティなどをきっかけに、取引・契約が行われることがあります。そこで、このアプリケーションを介して情報共有などを行えるようにしたいと考えました。

※Dynamo・Grasshopperは建築・製造業のCAD用のプログラミングツールです。CADのユーザー自身で設計業務を効率化するためのマクロを作成するなどに利用されます。
<img width="926" alt="スクリーンショット 2021-05-27 14 49 51" src="https://user-images.githubusercontent.com/66289694/119772917-dd5ea180-befa-11eb-923a-82905fcf3d9e.png">

## URL
未デプロイ

## テスト用アカウント
メールアドレス: user01@test.com
パスワード: user1111

## 利用方法
### ユーザー登録
1. 新規登録ボタンをクリックをします。
2. ユーザー情報を入力し、登録ボタンをクリックします。

### ログイン
1. ログインボタンをクリックをします。
2. ユーザー情報を入力し、ログインボタンをクリックします。

### 新規投稿
1. 上記の手順でログインします。
2. 新規投稿ボタンをクリックします。
3. 投稿に必要な情報を入力し、投稿ボタンをクリックします。

### 検索
1. プルダウンメニューからカテゴリー・ソフトウェアを選択します。
2. 検索ボタンをクリックします。

## 目指した課題解決
クリエイターと顧客またはクリエイター同士の情報や作品を共有することで、依頼するクリエイターを探す手間を削減したり、クリエイターの既存の資産を有効活用を促すことを目指します。
Dynamo・Grasshopperなど作成できるビジュアルプログラムを売買・共有・受発注するwebサイトがなく、SNSの有志同士のコミュニティなどをきっかけに、取引・契約が行われることがあります。そこで、このアプリケーションを介して情報共有などを行えるようにしたいと考えました。

## 洗い出した要件
- ユーザー管理機能
- 投稿機能
- 検索機能
- コメント機能
- 購入機能
- いいね機能
- リクエスト機能

## 実装した機能についての画像やGIFおよびその説明
- ユーザー管理機能
ユーザー登録、ログイン、ログアウト機能です。

- 投稿機能
クリエイターが作品・ツールを投稿することが可能です。サムネイルの画像、アイテムの名前、説明文、カテゴリーなどを登録可能です。

- 検索機能
プルダウンメニューからカテゴリーやソフトウェアによるアイテムの検索をすることが可能です。

## 実装予定の機能
- コメント機能
- 購入機能
- いいね機能
- リクエスト機能

## データベース設計

## usersテーブル
|Column            |Type  |Options    |
| ---------------- | ---- | --------- |
|nickname          |string|null: false|
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false|
|last_name         |string|null: false|
|first_name        |string|null: false|
|last_name_kana    |string|null: false|
|first_name_kana   |string|null: false|
|birthday          |date  |null: false|

### Association
- has_many :items
- has_many :purchases
- has_one :address

## Addressesテーブル
|Column         |Type        |Options    |
| --------      | ----       | --------- |
|postal_code    |string      |null: false|
|prefecture_id  |integer     |null: false|
|municipalities |string      |null: false|
|address_line1  |string      |null: false|
|address_line2  |string      |           |
|phone_number   |integer     |null: false|
|user           |references  |null: false, foreign_key: true|

### Association
- belongs_to :user

## itemsテーブル

|Column          |Type         |Options    |
| -------------- | ----        | --------- |
|name            |string       |null: false|
|description     |text         |null: false|
|category_id     |integer      |null: false|
|software_id     |integer      |null: false|
|version         |text         |null: false|
|os_id           |integer      |null: false|
|status_id       |integer      |null: false|
|price           |integer      |null: false|
|likes           |integer      |null: false|
|score           |integer      |null: false|
|user            |references   |null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :purchases

## purchasesテーブル
|Column   |Type         |Options    |
| ------- | ----------- | --------- |
|user     |references   |null: false, foreign_key: true|
|item     |references   |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## requestsテーブル
|Column   |Type         |Options    |
| ------- | ----------- | --------- |
|user     |references   |null: false, foreign_key: true|
|item     |references   |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## ローカルでの動作方法
