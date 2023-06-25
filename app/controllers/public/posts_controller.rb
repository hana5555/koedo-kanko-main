class Public::PostsController < ApplicationController
  def index
    @categories = Category.all
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @posts = @category.posts.published.display.order(created_at: :desc).all.page(params[:page])
    else
      @posts = Post.all.published.display
    end

    if params[:search].present?
      @posts = @posts.search(params[:search])
    end
    @posts = @posts.order(created_at: :desc)
    @posts = @posts.page(params[:page])
  end

  def mypage
    @user = User.find(params[:id])
    @posts = current_user.posts.published.page(params[:page]).reverse_order
    @category = Category.all
  end

  def new
    @post = Post.new
    @posts = current_user.posts.draft.page(params[:page]).reverse_order
  end

  def create
    @posts = current_user.posts.draft.page(params[:page]).reverse_order
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if !@post.save
      render :new
      return
    end
    flash[:success] = "投稿しました。"
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @category = Category.all
  end

  def edit
    @post = Post.find(params[:id])
    @posts = current_user.posts.draft.page(params[:page]).reverse_order
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    @posts = current_user.posts.draft.page(params[:page]).reverse_order
    if @post.update(post_params)
      flash[:success] = "投稿を更新しました。"
      redirect_to mypage_path(current_user)
    else
      render :edit
    end
  end

  def confirm
    @posts = current_user.posts.draft.page(params[:page]).reverse_order
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:danger] = "投稿を削除しました。"
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:text, :image, :category_id, :status)
  end

end
