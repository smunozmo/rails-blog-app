require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'Foo', photo: 'photo',
                        bio: 'My bio',
                        posts_counter: 1)
  end

  it 'name can not be null' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'posts_counter is not 0' do
    @user.posts_counter = 0
    expect(@user).to be_valid
  end

  it 'most_recent_posts returns null' do
    posts = User.most_recent_posts(@user)
    expect(posts.length).to be(0)
  end
end
