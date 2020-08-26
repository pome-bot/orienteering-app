# README

<h2 align="center">Orienteering App for Recreation</h2>

<div align="center">
  <img width="370" alt="ol_01" src="https://user-images.githubusercontent.com/61574277/91251892-5f1c7580-e797-11ea-87a7-eddf8abbce4f.png">

  <br>
  <br>

  <img width="369" alt="ol_02" src="https://user-images.githubusercontent.com/61574277/91251898-6774b080-e797-11ea-9ecd-97b4f9b87c37.png">
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

### **https://rocky-reaches.cf**  

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

<p align="center"><a target="_blank" rel="noopener noreferrer" href="https://user-images.githubusercontent.com/61574277/91252340-65f7b800-e798-11ea-81da-c73acff261b5.gif"><img src="https://user-images.githubusercontent.com/61574277/91252340-65f7b800-e798-11ea-81da-c73acff261b5.gif" alt="ol_04" style="max-width:100%;"></a></p>

- 座標の設定方法は以下のとおり。
  - 検索することで、おおまかな位置に移動できる。（GoogleのGeocoding APIを利用している。）
  - Google mapを動かすことで、位置の調整が可能である。
  - マーカーのある場所（地図の中央）が、コントロールの設定される場所となる。

---

<h3 align="center">- Send answer -</h3>

<!-- ![ol_03](https://user-images.githubusercontent.com/61574277/91252695-09e16380-e799-11ea-8c52-1731042790b5.gif) -->

<p align="center"><a target="_blank" rel="noopener noreferrer" href="https://user-images.githubusercontent.com/61574277/91252695-09e16380-e799-11ea-8c52-1731042790b5.gif"><img src="https://user-images.githubusercontent.com/61574277/91252695-09e16380-e799-11ea-8c52-1731042790b5.gif" alt="ol_03" style="max-width:100%;"></a></p>

<br>

- 参加者はコントロール毎に回答を送信できる。
- 送信方法は以下のとおりであり、非常にシンプルである。
  - コントロールのページを開く。
  - 回答欄に回答を入力する。
  - 送信ボタンを押す。

---

<h3 align="center">- New control -</h3>

<div align="center">
  <img width="371" alt="ol_05" src="https://user-images.githubusercontent.com/61574277/91275421-1b3b6780-e7bb-11ea-865b-3c50fe11435d.png">
</div>
<br>

- コントロールには名前、質問、回答候補、回答、ポイント、座標を設定できる。
- 1つのオリエンテーリングに複数のコントロールを設定できる。
  
<br><br>
 
## Development environment
### Tools
- Ruby
- Ruby on Rails
- Google Maps Platform
  - Maps JavaScript API
  - Geocoding API
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
### users table (gem: devise)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
#### Association
- has_many :orienteering_users
- has_many :orienteerings, through: :orienteering_users
- has_many :host_orienteerings, foreign_key: "host_id", class_name: "Orienteering", dependent: :destroy
- has_many :answers

### orienteerings table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|host_id|integer|null: false|
|opendate_at|datetime|null: false|
#### Association
- has_many :orienteering_users
- has_many :users, through: :orienteering_users
- has_many :controls
- belongs_to :host, class_name: "User"

### orienteering_users table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|orienteering_id|integer|null: false, foreign_key: true|
#### Association
- belongs_to :orienteering
- belongs_to :user

### controls table
|Column|Type|Options|
|------|----|-------|
|orienteering_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|question|string|null: false|
|choice|string||
|answer|string|null: false|
|position_lat|string|null: false|
|position_lng|string|null: false|
|point|integer|null: false|
#### Association
- has_many :answers
- belongs_to :orienteering

### answers table
|Column|Type|Options|
|------|----|-------|
|control_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|answer|string|null: false|
#### Association
- belongs_to :user
- belongs_to :control

## License

<p>Copyright (c) 2020 pome-bot</p>
<p>Released under the MIT license</p>

**https://raw.githubusercontent.com/pome-bot/orienteering-app/master/LICENSE.txt**

## Author

[Github](https://github.com/pome-bot)
