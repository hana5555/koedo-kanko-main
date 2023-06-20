class Public::MessagesController < ApplicationController
  def index
    @message = Message.page(params[:page]).reverse_order
  end
end
