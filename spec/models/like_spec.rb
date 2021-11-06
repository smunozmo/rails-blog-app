require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = User.create(name: 'Foo', photo: 'photo',
                        bio: 'My bio',
                        posts_counter: 1)
    @post = Post.create(author_id: @user.id, title: 'Foo Title',
                        text: 'My text',
                        comments_counter: 1, likes_counter: 0)
    @like = Like.create(author_id: @user.id, post_id: @post.id)
  end

  it 'Counter updates when new like' do
    Like.update_likes_counter(@post)
    expect(@post.likes_counter).to be(1)
  end
end
