require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.create(name: 'Foo', photo: 'photo',
                        bio: 'My bio',
                        posts_counter: 1)
    @post = Post.create(author_id: @user.id, title: 'Foo Title',
                        text: 'My text',
                        comments_counter: 1, likes_counter: 0)
    @new_post = Post.create(author_id: @user.id, title: 'Foo Title',
                            text: 'My text',
                            comments_counter: 1, likes_counter: 0)
    @comment = Comment.create(author_id: @user.id, post_id: @post.id, text: 'Comment')
    @new_comment = Comment.create(author_id: @user.id, post_id: @post.id, text: 'Comment')
  end

  it 'name has a valid length' do
    @post.title = 't' * 251
    expect(@post).to_not be_valid
  end

  it 'comments_counter is not 0' do
    expect(@post).to be_valid
  end

  it 'likes_counter is not 0' do
    expect(@post).to be_valid
  end

  it 'update_post_counter update post count' do
    Post.update_post_counter(@user)
    expect(@user.posts_counter).to be(2)
  end

  it 'most_recent_comments return last comments' do
    comments = Post.most_recent_comments(@post)
    expect(comments.length).to be(2)
  end
end
