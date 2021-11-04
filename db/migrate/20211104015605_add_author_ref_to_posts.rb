class AddAuthorRefToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :author, null: false, foreign_key: { to_table: :users}
  end
end
