class Admin::CommentsController < ApplicationController
  def index
    @comment = Comment.page(params[:page])
  end

  def commentpage
    @user = User.find(params[:id])
    #@comment = Comment.page(params[:page])
    @comment = @user.comments.page(params[:page]).reverse_order
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to admin_comments_path
  end


  private

  def comment_params
    params.require(:comment).permit(:is_displayed)
  end

end
