class AddNamePhotoBioPostsCounterToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :photo, :string
    add_column :users, :bio, :text
    add_column :users, :posts_counter, :integer
  end
end
