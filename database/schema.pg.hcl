schema "gcook" {}

table "users" {
  schema = schema.gcook
  column "id" {
    type = uuid
  }
  column "name" {
    type = varchar(255)
  }
  column "email" {
    type = varchar(255)
  }
  column "created_at" {
    type = timestamp
  }
  column "updated_at" {
    type = timestamp
  }
  primary_key {
    columns = [column.id]
  }
}

table "recipes" {
  schema = schema.gcook
  column "id" {
    type = uuid
  }
  column "user_id" {
    type = uuid
  }
  column "title" {
    type = varchar(255)
  }
  column "instructions" {
    type = varchar(255)
  }
  column "created_at" {
    type = timestamp
  }
  column "updated_at" {
    type = timestamp
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "user_id" {
    columns     = [column.user_id]
    ref_columns = [table.users.column.id]
  }
}

table "ingredients" {
  schema = schema.gcook
  column "id" {
    type = uuid
  }
  column "recipe_id" {
    type = uuid
  }
  column "name" {
    type = varchar(255)
  }
  column "quantity" {
    type = varchar(255)
  }
  column "created_at" {
    type = timestamp
  }
  column "updated_at" {
    type = timestamp
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "recipe_id" {
    columns     = [column.recipe_id]
    ref_columns = [table.recipes.column.id]
  }
}

// comments
// | id | recipe_id | user_id | text | created_at |

// ratings
// | id | recipe_id | user_id | score (1-5) | created_at |

// tags
// | id | name |
// （例：和食, パスタ, ヴィーガン）

// recipe_tags（多対多中間テーブル）
// | recipe_id | tag_id |
