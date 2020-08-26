# README

<h2 align="center">Orienteering App for Recreation</h2>

<div align="center">
  <img width="320" alt="ol_01" src="https://user-images.githubusercontent.com/61574277/91251892-5f1c7580-e797-11ea-87a7-eddf8abbce4f.png">

<br>
<br>

  <img width="320" alt="ol_02" src="https://user-images.githubusercontent.com/61574277/91251898-6774b080-e797-11ea-9ecd-97b4f9b87c37.png">
</div>

<br><br><br>

## What is this?
<p>
レクリエーションのオリエンテーリングに利用できるアプリケーション。Google map を使って座標を設定することができる。このアプリケーションの特徴は以下のとおり。
</p>

- 1つのオリエンテーリングに複数のコントロール（目標地点）を作成できる。
- コントロールは Google map を操作して座標を設定できる。
- ホストは、コントロールに問題、回答候補、回答などを設定できる。
- 参加者は、コントロール毎に回答を送信できる。
- ホストは、参加者の回答の結果を確認することができる。

<br><br>

## Why did I make this?

- レクリエーションのオリエンテーリングに利用できるアプリケーションがあれば面白いと思ったから。
- Google map api を利用してのアプリケーションを作成したかったから。

<br><br>

## App URL

### **https://peaceful-brushlands.ml**  

Test account:
  - Host account:
    - email: user1@user1
    - password: useruser
  - Participant account:
    - email: user2@user2
    - password: useruser

<br><br>

## Usage

`$ git clone https://github.com/pome-bot/orienteering-app.git`  

<br><br>
 
## Features

<h3 align="center">- Set coordinates -</h3>

<!-- ![ol_04](https://user-images.githubusercontent.com/61574277/91252340-65f7b800-e798-11ea-81da-c73acff261b5.gif) -->

<p align="center"><a target="_blank" rel="noopener noreferrer" href="https://user-images.githubusercontent.com/61574277/91252340-65f7b800-e798-11ea-81da-c73acff261b5.gif"><img src="https://user-images.githubusercontent.com/61574277/91252340-65f7b800-e798-11ea-81da-c73acff261b5.gif" alt="ol_04" style="max-width:80%;"></a></p>

---

<h3 align="center">- Send answer -</h3>

<!-- ![ol_03](https://user-images.githubusercontent.com/61574277/91252695-09e16380-e799-11ea-8c52-1731042790b5.gif) -->

<p align="center"><a target="_blank" rel="noopener noreferrer" href="https://user-images.githubusercontent.com/61574277/91252695-09e16380-e799-11ea-8c52-1731042790b5.gif"><img src="https://user-images.githubusercontent.com/61574277/91252695-09e16380-e799-11ea-8c52-1731042790b5.gif" alt="ol_03" style="max-width:80%;"></a></p>

<br>

- リーグが作成されるとリーグ表が作成される。
- スコアが送信されると、そのスコアが反映される。
- デフォルトでは、以下の設定となっている。
  - はじめは並びは名前順
  - スコアがあると、並びはランク順
  - 勝ち点は、勝ち：3、負け：0、引き分け：1
- ランクは以下のとおりにつけられる。
  - 勝ち点の高いほうが上
  - 勝ち点が同じ場合は、得失点差の高いほうが上
  - 勝ち点、得失点差が同じで、それが2名だった場合、その2名の対戦の勝者が上
  - 勝ち点、得失点差が同じで、それが2名だった場合で、その2名の対戦が引き分けのときは同ランク
  - 勝ち点、得失点差が同じで、それが3名以上だった場合、同ランク
- リーグの設定で以下のことが可能
  - 勝ち点の設定
  - 並び順の設定（名前順、ランク順）
- スコアが表示される箇所をクリックすると、スコアフォームにデータが入る。
- スコアの訂正は何度でも可能
- スコアをリセットしたい場合は、対戦者のみを送信することでリセットできる。

---

<h3 align="center">- Recommended order -</h3>

<div align="center">
  <img width="373" alt="9cc21b627b800db2614a47e6b367c5a5" src="https://user-images.githubusercontent.com/61574277/89482914-dcc31600-d7d5-11ea-92ee-480448924a48.png">
</div>
<br>

- リーグが作成されるとおすすめの試合順が作成される。
- このおすすめの試合順の特徴は以下のとおり。
  - メンバーそれぞれ1試合ある組み合わせを1ラウンドとしている。
  - ラウンド毎に試合相手が変わる。
  - 最後までラウンドを行うと、全試合できることとなる。
  - メンバーの数が偶数のときラウンド数：（メンバーの数 - 1）、奇数のときラウンド数：メンバーの数 
  - メンバーの数が奇数のとき、それぞれのラウンドで試合の無いメンバーが1人いる。
  - 試合間隔は可能な限り公平となるようになっている。
  - 左側を先攻、右側を後攻と決めることで、バランスよく試合することができる。
  - それぞれの試合の箇所をクリックすると、スコアフォームにデータが入る。
  - リーグ作成ごとに作成される試合順はランダムである。
  
<br><br>

 
## Development environment
### Tools
- Ruby
- Ruby on Rails
- mysql
- Heroku
- Cloud Flare
- Git
- Visual Studio Code

### Versions
- Rails version	6.0.3.2
- Ruby version	ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-darwin19]
- RubyGems version	3.0.3
- Rack version	2.2.3


## Database design
## users table (gem: devise)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|image|text||
|email|string|null: false, unique: true|
|password|string|null: false|
|deleted_at|datetime||
### Association
- has_many :groups_users
- has_many :groups, through: :groups_users
- has_many :leagues_users
- has_many :leagues, through: :leagues_users
- has_many :games
- has_many :messages

## groups table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
### Association
- has_many :groups_users
- has_many :users, through: :groups_users, dependent: :destroy
- has_many :leagues, dependent: :destroy

## groups_users table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## leagues table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|group_id|integer|null: false, foreign_key: true|
|win_point|integer|null: false, default: 3|
|lose_point|integer|null: false, default: 0|
|even_point|integer|null: false, default: 1|
|order_flag|integer|null: false, default: 0|
### Association
- belongs_to :group
- has_many :leagues_users
- has_many :users, through: :leagues_users, dependent: :destroy
- has_many :games, dependent: :destroy
- has_many :messages, dependent: :destroy

## leagues_users table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|league_id|integer|null: false, foreign_key: true|
|order|integer||
|won|integer||
|lost|integer||
|even|integer||
|point|integer||
|difference|integer||
|rank|integer||
### Association
- belongs_to :user
- belongs_to :league

## games table
|Column|Type|Options|
|------|----|-------|
|league_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|user_score|integer||
|user2_score|integer||
|order|integer|null: false|
### Association
- belongs_to :user
- belongs_to :league

## messages table
|Column|Type|Options|
|------|----|-------|
|league_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|text|string|null: false|
### Association
- belongs_to :league
- belongs_to :user



## License

<p>Copyright (c) 2020 pome-bot</p>
<p>Released under the MIT license</p>

**https://raw.githubusercontent.com/pome-bot/orienteering-app/master/LICENSE.txt**

## Author

[Github](https://github.com/pome-bot)
