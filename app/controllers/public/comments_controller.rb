class Public::CommentsController < ApplicationController
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

end
