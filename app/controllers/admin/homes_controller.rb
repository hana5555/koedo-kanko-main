class Admin::HomesController < ApplicationController
  def top
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


    #@posts = Post.published.display.page(params[:page]).reverse_order
    #@posts = @posts.where('location LIKE ?', "%#{params[:search]}%") if params[:search].present?
    #@categories = Category.all

    #if params[:category_id].present?
    #  @category = Category.find(params[:category_id])
    #  @posts = @category.posts.published.display.order(created_at: :desc).all.page(params[:page])
    #elsif
    #  @categories = Category.all
    #  if params[:page].present?
    #    @posts = Post.published.display.order(created_at: :desc).all.page(params[:page])
    #  elsif
    #    @posts = Post.published.display.order(created_at: :desc).all.page(params[:page])
    #  end
    #end
  end
end
