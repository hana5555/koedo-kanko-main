class Admin::UsersController < ApplicationController
  def index
    @user = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "アカウント情報を更新しました。"
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :username, :email, :telephone_number, :is_deleted)
  end
end
