class Admin::CommentsController < ApplicationController
  def index
    @comment = Comment.page(params[:page])
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
