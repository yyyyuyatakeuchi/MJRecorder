# README

使用した技術は以下になります。
・Rails ~> 6.1.3

・Ruby 2.7.2

・HTML, CSS

・JavaScript

・Vue.js

・Heroku

・Git, GitHub

麻雀の総得点を計算し、それら得点を記録するアプリになります。
終了後の計算が面倒くさいという友人の熱い要望から本アプリを作りました。
今後、ウマやオカなど複雑な設定ができるように改修していく予定です。

直感的な操作（UI）とDB設計を工夫して作成しました。

DB設計が以下のようになっています。

・Userモデル

　　…ユーザー基本情報（email,passwordなど）

・ScoreSettingモデル（user_idと紐付け）

　　…計算設定情報（半荘回数,Rating,基準点,ウマ,オカ,最終的な総得点）

・RawScoreモデル（score_setting_idと紐付け）

　　…一回ごとの素点

