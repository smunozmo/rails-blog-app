class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table "likes", force: :cascade do |t|
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.bigint "author_id", null: false
      t.bigint "post_id", null: false
      t.index ["author_id"], name: "index_likes_on_author_id"
      t.index ["post_id"], name: "index_likes_on_post_id"
    end

    add_foreign_key "comments", "posts", primary_key: "author_id"
    add_foreign_key "comments", "users", column: "author_id"
    add_foreign_key "likes", "posts", primary_key: "author_id"
    add_foreign_key "likes", "users", column: "author_id"
    add_foreign_key "posts", "users"
  end
end
