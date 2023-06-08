class Public::PostsController < ApplicationController
  def index
    @post = Post.all
    #@posts = Post.user_id
    #@posts = Post.published.page(params[:page]).reverse_order
    #@posts = @posts.where('location LIKE ?', "%#{params[:search]}%") if params[:search].present?
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
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:text, :image, :category_id, :status, :is_displayed)
  end

end
