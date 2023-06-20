class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]
      @posts = Post.looks(params[:search], params[:word])
  end
end
