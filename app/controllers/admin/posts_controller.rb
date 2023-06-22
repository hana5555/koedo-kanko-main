class Admin::PostsController < ApplicationController

  def userpage
    @user = User.find(params[:id])
    @posts = @user.posts.published.page(params[:page]).reverse_order
    @category = Category.all
  end

  def show
    @post = Post.find(params[:id])
    @category = Category.all
  end

  def category_result
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @posts = @category.posts.order(created_at: :desc).all.page(params[:page])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash[:notice] = "公開ステータスを更新しました。"
    redirect_to admin_path
  end

  private

  def post_params
    params.require(:post).permit(:status, :is_displayed)
  end


end
