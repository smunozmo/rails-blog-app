require 'rails_helper'

RSpec.describe 'Login page', js: true, type: :system do
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

  describe 'contains' do
    it 'username and password inputs, and Log in button' do
      visit new_user_session_path
      expect(page).to have_field('email')
      expect(page).to have_field('password')
      expect(page).to have_button('Log in')
    end
  end

  describe 'when I click the submit button' do
    it 'without filling in the username and the password, I get a detailed error' do
      visit new_user_session_path
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'after filling in the username and the password with incorrect data, I get a detailed error' do
      visit new_user_session_path
      fill_in 'email', with: 'wrong_user@email.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'after filling in the username and the password with correct data, I am redirected to the root page' do
      visit new_user_session_path
      fill_in 'email', with: 'user@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end
  end
end