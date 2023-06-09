class Public::PostsController < ApplicationController
  def index
    @posts = Post.published.page(params[:page]).reverse_order
    @posts = @posts.where('location LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    #@user = @post.User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def confirm
    @posts = current_user.posts.draft.page(params[:page]).reverse_order
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:text, :image, :category_id, :status)
  end

end
