class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @userlist = User.all
    @posts = Post.joins(:author).where(user: { id: @user.id }).order(created_at: :desc)
    @comments = Comment.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:user_id])
    @userlist = User.all
    @post = Post.find(params[:id])
    @comments = Comment.order(created_at: :desc)
  end
end