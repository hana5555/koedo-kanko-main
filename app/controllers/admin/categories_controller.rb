class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "カテゴリーを追加しました。"
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render "index"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "カテゴリーを更新しました。"
      redirect_to admin_categories_path
    else
      render "edit"
    end
  end

   def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:danger] = "カテゴリーを削除しました。"
    redirect_to admin_categories_path
   end


  private

  def category_params
    params.require(:category).permit(:name)
  end

end
