class AddAuthorRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :author, null: false, foreign_key: { to_table: :users }
  end
end
