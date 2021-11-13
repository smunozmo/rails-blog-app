require 'rails_helper'

RSpec.describe 'in user post index page', js: true, type: :system do
  before(:all) do
    @first_user = User.create(name: 'Foo', photo: 'photo',
                              bio: 'Awesome bio',
                              posts_counter: 0, email: 'user@mail.com', password: '111111', confirmed_at: Time.now)
    @second_user = User.create(name: 'Bar', photo: 'photo',
                               bio: 'Awesome bio',
                               posts_counter: 0, email: 'test@mail.com', password: '111111', confirmed_at: Time.now)
    @first_post = Post.create(title: 'Title 1', text: 'Lorem ipsum',
                              author_id: @first_user.id, comments_counter: 0, likes_counter: 0)
    @second_post = Post.create(title: 'Title 2', text: 'Lorem ipsum',
                               author_id: @first_user.id, comments_counter: 0, likes_counter: 0)
    @third_post = Post.create(title: 'Title 3', text: 'Lorem ipsum',
                              author_id: @first_user.id, comments_counter: 0, likes_counter: 0)
    @fourth_post = Post.create(title: 'Title 4', text: 'Lorem ipsum',
                               author_id: @first_user.id, comments_counter: 0, likes_counter: 0)
    Comment.create(text: 'Wow comment', author_id: @second_user.id, post_id: @fourth_post.id)
    Comment.create(text: 'Best comment', author_id: @first_user.id, post_id: @fourth_post.id)
  end

  describe 'I can see' do
    it 'the profile picture for each user' do
      visit new_user_session_path
      fill_in 'email', with: 'user@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      user = User.find_by(name: 'Foo')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content(user.photo)
    end

    it 'the user\'s username' do
      visit new_user_session_path
      fill_in 'email', with: 'user@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      user = User.find_by(name: 'Foo')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content(user.name)
    end

    it 'the number of posts the user has written' do
      visit new_user_session_path
      fill_in 'email', with: 'user@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      user = User.find_by(name: 'Foo')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end

    it 'a post\'s title' do
      visit new_user_session_path
      fill_in 'email', with: 'user@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      user = User.find_by(name: 'Foo')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content(user.posts.first.title)
    end

    it 'some of the post\'s body' do
      visit new_user_session_path
      fill_in 'email', with: 'user@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      user = User.find_by(name: 'Foo')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content(user.posts.first.text)
      expect(page).to have_content(user.posts.last.text)
    end

    it 'the first comment on a post' do
      visit new_user_session_path
      fill_in 'email', with: 'user@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      user = User.find_by(name: 'Foo')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content(user.posts.last.comments.first.text)
    end

    it 'how many comments a post has' do
      visit new_user_session_path
      fill_in 'email', with: 'user@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      user = User.find_by(name: 'Foo')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content("Comments: #{user.posts.first.comments_counter}")
    end

    it 'how many likes a post has' do
      visit new_user_session_path
      fill_in 'email', with: 'user@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      user = User.find_by(name: 'Foo')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content("Likes: #{user.posts.first.likes_counter}")
    end

    it 'a section for pagination if there are more posts then fit on the view' do
      visit new_user_session_path
      fill_in 'email', with: 'user@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      user = User.find_by(name: 'Foo')
      click_link user.name
      click_link 'See all posts'
      expect(page).to have_content('Pagination')
    end
  end

  describe 'when I click' do
    it 'on a post, it redirects me to that post\'s show page' do
      visit new_user_session_path
      fill_in 'email', with: 'user@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      user = User.find_by(name: 'Foo')
      click_link user.name
      click_link 'See all posts'
      click_link user.posts.first.title
      expect(current_path).to eql(user_post_path(id: user.posts.first.id, user_id: user.id))
    end
  end
end
