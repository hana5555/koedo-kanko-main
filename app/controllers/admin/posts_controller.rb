class Admin::PostsController < ApplicationController

  def index
    @posts = Post.published.page(params[:page]).reverse_order
  end

  def userpage
    @user = User.find(params[:id])
    @posts = @user.posts.published.page(params[:page]).reverse_order
    @category = Category.all
  end

  def show
    @post = Post.find(params[:id])
    @category = Category.all
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
