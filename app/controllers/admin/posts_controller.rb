class Admin::PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:status, :is_displayed)
  end


end
