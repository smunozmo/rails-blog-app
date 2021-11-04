class AddPostRefToLikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :likes, :post, null: false, foreign_key: true
  end
end
