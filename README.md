# ながのCAKE

![S__22970372_0-f7e540c67dca8b80e10336d8548ec965b51bdbef2f9f1318b4fec941fc10ecd8](https://user-images.githubusercontent.com/90138524/143573125-64991fd6-5a01-4bed-afbb-eed1701bf7be.jpg)

# 『概要』

* 長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。

# 『背景』

* 元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るよう になった。 InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管 理機能を含んだ通販サイトを開設しようと思い至った。

# 『ER図』

<img width="1054" alt="スクリーンショット 2021-11-26 20 08 32" src="https://user-images.githubusercontent.com/90138524/143573136-5d9475b2-540b-463c-b7db-6eb6b2990cca.png">

# 『テーブル定義書

<img width="431" alt="スクリーンショット 2021-11-26 20 53 26" src="https://user-images.githubusercontent.com/90138524/143577984-7cd52e48-fad9-425d-b759-3e377a5290dc.png">

<img width="373" alt="スクリーンショット 2021-11-26 21 00 10" src="https://user-images.githubusercontent.com/90138524/143577992-6e139f31-f25d-4bfa-af46-924463b04344.png">

# 『アプリケーション詳細設計書』

* 顧客側

<img width="949" alt="スクリーンショット 2021-11-26 20 51 07" src="https://user-images.githubusercontent.com/90138524/143578076-e87226a1-c72b-473a-9e8c-0948c3bbaff2.png">

* 管理者側

<img width="946" alt="スクリーンショット 2021-11-26 20 49 52" src="https://user-images.githubusercontent.com/90138524/143578089-e7f80005-36d9-4752-9c40-65e2ceb6e7cd.png">

* GEM

<img width="387" alt="スクリーンショット 2021-11-26 20 52 24" src="https://user-images.githubusercontent.com/90138524/143578100-6531ca2b-0583-42d7-9b3b-97556539fab5.png">

# 『実装機能』

会員側

* ログイン/ログアウト

* 会員登録/退会/編集

* 配送先指定

* カート（商品追加/一覧/編集）

* 注文 （支払い方法,配送先の選択）

* 注文履歴一覧/詳細

管理者側

* ログイン/ログアウト

* 注文履歴一覧/詳細（注文ステータス, 製作ステータスの切り替えが可能）

* 会員一覧/詳細（会員ステータスを有効/退会に切り替えが可能）

* 商品一覧/詳細/編集（販売ステータスの変更が可能）

* 商品のジャンル設定

# 『開発環境』

* Ruby 2.6.3

* Rails 5.2.5

# 『チーム』

* 几帳面エー型

# 『メンバー』

* カケユキ

* アンディー

* ヤマト