## テーブル
* admin
### カラム:データ型
        * id
        * name: string
        * email: string
        * password_digest: string  

## テーブル  
* user  
### カラム:データ型
        * id
        * name: string
        * email: string
        * password_digest: string  

## テーブル  
* task  
### カラム:データ型  
        * id
        * user_id(FK)
        * title: string
        * content: string
        * timelimit: date
        * priority: integer
        * status: string

## テーブル  
* label  
### カラム:データ型  
        * id
        * task_id(FK)
        * name: string  

# herokuデプロイ手順(Rails 5.2.4.2、RSpec 3.9)
### heroku login　ログイン
## &emsp;⇩
### heroku create　アプリ作成
## &emsp;⇩
### rails assets:precompile　アセットコンパイル
## &emsp;⇩
### git add -A → git commit -m "メッセージ" → git push origin ブランチ名
## &emsp;⇩
### git push heroku ブランチ名:master　※今回は、masterにマージする前なので、ブランチ名を付ける
## &emsp;⇩
### heroku run rails db:migrate　herokuデータベースのマイグレーションを手動で行う
## &emsp;⇩
### heroku open　アプリ公開ページへ
