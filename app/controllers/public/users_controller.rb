class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "アカウント情報を更新しました。"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  #いいね一覧を表示
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    @favorite_posts = Kaminari.paginate_array(@favorite_posts).page(params[:page])
  end

  def unsubscribe
    @user = User.find(params[:id])
  end

  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :username, :email, :telephone_number)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , warning: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to posts_path
    end
  end

end
