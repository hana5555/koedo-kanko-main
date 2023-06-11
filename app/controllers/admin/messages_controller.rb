class Admin::MessagesController < ApplicationController
  def index
    @message = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    #Message.create!(message_params)
    @message = Message.new(message_params)
    if @message.save
      redirect_to admin_messages_path(@message)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def message_params
    params.require(:message).permit(:image, :message)
  end
end
