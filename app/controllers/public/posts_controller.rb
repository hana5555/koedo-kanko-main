class Public::PostsController < ApplicationController
  def index
# current_user 現在ログインしているユーザーがとれる
# current_admin 現在ログインしているadmin
    @posts = Post.published.display.page(params[:page]).reverse_order
    @posts = @posts.where('location LIKE ?', "%#{params[:search]}%") if params[:search].present?
    @categories = Category.all

    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @posts = @category.posts.published.display.order(created_at: :desc).all.page(params[:page])
      # redirect_to category_result_path
    elsif
      @categories = Category.all
      if params[:page].present?
        @posts = Post.published.display.order(created_at: :desc).all.page(params[:page])
      elsif
        @posts = Post.published.display.order(created_at: :desc).all.page(params[:page])
      end
    end
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
    if @post.save
      flash[:notice] = "投稿しました。"
      redirect_to posts_path
    else
      render :new
    end
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
    if @post.update(post_params)
      flash[:notice] = "投稿を更新しました。"
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
    flash[:notice] = "投稿を削除しました。"
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:text, :image, :category_id, :status)
  end

end
