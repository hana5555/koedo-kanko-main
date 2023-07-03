class Public::CommentsController < ApplicationController
  before_action :is_matching_login_user, only: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = @post.id
    comment.save
    render :comments
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    @post = Post.find(params[:post_id])
    render :comments
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :is_displayed)
  end

  def is_matching_login_user
    comment = Comment.find(params[:id])
    unless comment.user.id == current_user.id
      redirect_to posts_path
    end
  end


end
