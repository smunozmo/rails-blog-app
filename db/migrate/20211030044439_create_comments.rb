class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table "comments", force: :cascade do |t|
      t.text "text"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.bigint "author_id", null: false
      t.bigint "post_id", null: false
      t.index ["author_id"], name: "index_comments_on_author_id"
      t.index ["post_id"], name: "index_comments_on_post_id"
    end
  end
end
