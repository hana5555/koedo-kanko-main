class Public::MessagesController < ApplicationController
  def index
    @message = Message.all
  end
end
