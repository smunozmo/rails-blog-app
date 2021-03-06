class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.text = params[:comment][:text]
    @comment.author_id = current_user.id
    @comment.post_id = params[:id]
    if @comment.save
      flash[:notice] = 'Success'
      redirect_to user_post_url(id: params[:id], user_id: params[:user_id])
    else
      flash[:notice] = 'Error'
      render :new
    end
  end
end
