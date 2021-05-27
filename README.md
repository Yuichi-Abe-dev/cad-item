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

<img width="595" alt="スクリーンショット 2021-05-27 14 01 49" src="https://user-images.githubusercontent.com/66289694/119775032-00d71b80-befe-11eb-8a55-6e66105a6a78.png">

<img width="618" alt="スクリーンショット 2021-05-27 15 15 06" src="https://user-images.githubusercontent.com/66289694/119775295-61feef00-befe-11eb-81b2-968ebd9c4253.png">

- 投稿機能

クリエイターが作品・ツールを投稿することが可能です。サムネイルの画像、アイテムの名前、説明文、カテゴリーなどを登録可能です。

<img width="669" alt="スクリーンショット 2021-05-27 14 01 02" src="https://user-images.githubusercontent.com/66289694/119775359-7347fb80-befe-11eb-98ee-548af914d690.png">

- 検索機能

プルダウンメニューからカテゴリーやソフトウェアによるアイテムの検索をすることが可能です。

<img width="918" alt="検索1" src="https://user-images.githubusercontent.com/66289694/119775907-36c8cf80-beff-11eb-932e-bf761986c4ed.png">
<img width="918" alt="検索2" src="https://user-images.githubusercontent.com/66289694/119775923-3b8d8380-beff-11eb-90b0-860e64c404ff.png">

## 実装予定の機能
- コメント機能
- 購入機能
- いいね機能
- リクエスト機能

## データベース設計
ER図
![original_app-db_1](https://user-images.githubusercontent.com/66289694/119774830-bd7cad00-befd-11eb-8e30-eb1bdb0dfc9e.png)

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
1. ターミナルを起動

2. アプリケーションをダウンロードしたいカレントディレクトリに移動

3. ターミナルで以下のコマンドを実行しアプリケーションをクローン
``` % git clone https://github.com/Yuichi-Abe-dev/cad-item.git ```

4. ターミナルで以下のコマンドを実行しデータベースを作成
``` % rails db:create ```
