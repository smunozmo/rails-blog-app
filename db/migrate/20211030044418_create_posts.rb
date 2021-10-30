class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table "posts", primary_key: "author_id", id: :bigint, force: :cascade do |t|
      t.string "title"
      t.text "text"
      t.integer "comments_counter"
      t.integer "likes_counter"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.bigint "user_id", null: false
      t.string "user"
      t.index ["user"], name: "index_posts_on_user"
      t.index ["user_id"], name: "index_posts_on_user_id"
    end
  end
end
