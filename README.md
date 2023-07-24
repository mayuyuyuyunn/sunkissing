<div align="center">
  <h1>Sunkissing - 日焼け止め塗り直し通知アプリ -　</h1>
    <img src="https://github.com/mayuyuyuyunn/sunkissing/blob/main/app/assets/images/sunkissing_logo.png?raw=true" alt="Sunkissng image"/>
</div>

  <p><a href="https://www.sunkissing.net">Sunkissing TOP PAGE へ</a></p>
  <p>※スマートフォンから見ることをおすすめします！</p>

## サービス概要
  日焼け止めの塗り直しをリマインドするサービスです。

  その日の紫外線の強さによって適切な日焼け止めの強さを提案、あなたの予定に合わせてLINEで日焼け止めの塗り直しをLINEでリマインドします。

## 使い方
| 準備：QRコードから友だち追加します。 | 1. トーク画面から<br>アプリを開きます。 | 2. スケジュール作成ボタンを押します<br> |
| ---- | ---- | ---- |
| <img src="https://github.com/mayuyuyuyunn/sunkissing/assets/95003927/ad45611c-c91b-4cd6-9df8-10b40a5f186c" width="500x500"> | <img src="https://github.com/mayuyuyuyunn/sunkissing/assets/95003927/15cafc4d-6d2f-416b-96b6-1731c8e55865" width="500x500"> | <img src="https://github.com/mayuyuyuyunn/sunkissing/assets/95003927/166ea73a-3d0d-4f06-a21a-c68713fd8e82" width="500x500"> |
| 3.スケジュールを登録します | 4.登録いただいた情報に合わせて<br>LINEが届きます！ | 番外編： 右上の太陽マークから<br>各種設定ができます。　|
| <img src="https://github.com/mayuyuyuyunn/sunkissing/assets/95003927/b64ca5b0-f1c9-4198-8035-4d56255584f3" width="500x500"> | <img src="https://github.com/mayuyuyuyunn/sunkissing/assets/95003927/84553032-57b7-4151-b2bb-cb5146cec209" width="500x500"> | <img src="https://github.com/mayuyuyuyunn/sunkissing/assets/95003927/91598314-d0e7-4ca7-8642-f3d368e1a764" width="500x500"> |


## メインのターゲットユーザー
  日焼け止めを毎日丁寧に塗っても朝しか塗っていない人
  日焼け止めを夏の期間しか塗らない人
  そもそも日焼け止めを塗る習慣がない人

## ユーザーが抱える課題
- 日焼け止めの塗り直す頻度がわからない、分かっていてもうっかり忘れてしまう
- そもそも日焼け止めを塗る習慣がない
- 日焼け止めの使い分け方法がわからない

## 解決方法
- 予定に合わせて2〜3時間起きに日焼け止めを塗り直すようLINEで通知する。
- 日常でよく使うコミュニケーションツールのLINEで通知をしておけば見た時に塗りなおせる。
- その日の紫外線の強さによって適切な強さの日焼け止めを提案する。

## なぜこのサービスを作りたいのか？
日焼けはお肌の大敵だからです！！ テレビを見ているときに、日焼け止めは強いものを常用すればいいわけではないことを知りました。 その日の行動に合わせて使い分けが大事だということを知り、知らない、または使い分けてない人が多いのではと思いました。 日焼け止めをせっかく朝丁寧に塗っても、日中忙しくしていると、どうしても塗り直すのを忘れてしまう・・・。 LINEで通知を貰えたら、日中忙しくしていても思い出してきちんと塗り直すことができるのでは？と思い日焼け止めのアプリを作りたいと思いました。

## 主な機能
  **ログイン機能**
  - LIFFを使用しているため、LINEでログインしLIFFブラウザ上で操作することが出来ます。 

  **リマインド機能**
  - スケジュール登録画面で、今日のお出かけタイプと家を出る時間を入力します。
  - 登録いただいたスケジュールに合わせてLINEでリマインドが届きます。
  - 家を出る時間は1時間単位で選択することができ、指定した日時にschedulerでLINE通知が送られます。
  - スケジュールは、当日分のみ登録ができます。アプリを使用して日焼け止めを塗ることを習慣にすることも目標にしているためです。
  - スケジュールは登録・削除のみができる仕様になっています。

  **紫外線情報機能**
  - 事前に登録いただいた都道府県に合わせて紫外線情報をお届けします。
  - 今日にぴったりの日焼け止めをレコメンドします。

  **日焼け止め検索機能**
  - SPFとPAで日焼け止めの検索ができます。
  - タグに特徴を記載しているので自分好みの日焼け止めを選べます。
  - たくさんデータを入れると選ぶことに悩んでしまうので、データ数を最小限にしました。
  - 日焼け止めの詳細画面から楽天で購入するリンクに飛ぶことができます。（アフィリエイト）
  
  **カレンダー機能**
  - 今月お肌のために何日頑張ったのか、今までどれくらい頑張れたのか見ることができます。

## 今後実装を考えている機能
  - LINEのトーク画面から紫外線情報が見れる機能
  - スケジュールをまとめて登録できる機能

## 使用技術
**バックエンド**
  - Ruby （3.1.2）
  - Rails （7.0.4）
**フロントエンド**
  - LINE Front-end Framework（LIFF）v2.22.2
  - JavaScript
  - DaisyUI
  - Tailwind CSS
**インフラ**
  - Heroku
  - mkcert v1.4.4(ローカルでのみ使用)

## 画面遷移図
[画面遷移図](https://www.figma.com/file/AuTXzXzspRWLh4hymbQoxy/Sunkissing!!?node-id=0%3A1&t=wDW6wXZRubjHHtvq-0)

## ER図
<img src='https://github.com/mayuyuyuyunn/sunkissing/blob/main/sunkissing.drawio.png'>
