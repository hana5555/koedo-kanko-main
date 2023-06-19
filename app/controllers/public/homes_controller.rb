class Public::HomesController < ApplicationController
  def top
    @messages = Message.all.order('id DESC').limit(3)
  end
end
