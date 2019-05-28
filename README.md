
# DB設計

## users table

| Column | Type   | Options                   |
| :----: | :----: | :-----------------------: |
| name   | string | index: true, null: false  |
| mail   | string | null: false, unique: true |

### Association
- has_many :articles


## articles table

| Column  | Type       | Options                        |
| :-----: | :--------: | :----------------------------: |
| title   | string     | null: false                    |
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
