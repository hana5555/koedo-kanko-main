class Admin::MessagesController < ApplicationController
  def index
    @message = Message.page(params[:page]).reverse_order
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "メッセージを投稿しました。"
      redirect_to admin_messages_path(@message)
    else
      render :new
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      flash[:notice] = "メッセージを更新しました。"
      redirect_to admin_messages_path(@message)
    else
      render :edit
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    flash[:notice] = "メッセージを削除しました。"
    redirect_to admin_messages_path
  end


  private

  def message_params
    params.require(:message).permit(:image, :title, :message)
  end
end
