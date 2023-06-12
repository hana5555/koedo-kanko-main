class Admin::MessagesController < ApplicationController
  def index
    @message = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
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
      redirect_to admin_messages_path(@message)
    else
      render :edit
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to admin_messages_path
  end


  private

  def message_params
    params.require(:message).permit(:image, :message)
  end
end
