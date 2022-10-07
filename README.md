# データベースに異常発生で、やり直し202210061120

# テーブル設計 


## users テーブル

| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| email                 | string      |                                |
| encrypted_password    | string      | null: false, unique: true      |
| name                  | string      | null: false                    |
| profile               | text        | null: false                    |
| occupation            | text        | null: false                    |
| position              | text        | null: false                    |

### users Association
- has_many :prototypes
- has_many :comments


## comments テーブル

| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| content               | text        | null: false                    |
| prototype             | references  | null: false, foreign_key: true |
| user                  | references  | null: false, foreign_key: true |

### comments Association
- belongs_to :user
- belongs_to :prototype

## prototypes テーブル

| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| title                 | string      | null: false                    |
| catch_copy            | text        | null: false                    |
| concept               | text        | null: false                    |
| user                  | references  | null: false, foreign_key: true |

### prototypes　Association
- belongs_to :user
- has_many :comments
