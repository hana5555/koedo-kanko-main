class Admin::CommentsController < ApplicationController
  def index
    @comment = Comment.page(params[:page]).reverse_order
  end

  def commentpage
    @user = User.find(params[:id])
    @comment = @user.comments.page(params[:page]).reverse_order
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "コメントを削除しました。"
    redirect_to admin_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:is_displayed)
  end

end
