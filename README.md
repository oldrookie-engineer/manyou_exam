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
        * deadline: date
        * priority: integer
        * status: string

## テーブル  
* label  
### カラム:データ型  
        * id
        * task_id(FK)
        * name: string  
