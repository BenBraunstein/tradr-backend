class MessagesController < ApplicationController
  def index
    messages = Message.all.order(:id)
    if messages.length > 50
        render json: messages[messages.length-50, messages.length]
    else
        render json: messages
    end
  end

  def create
    Message.create(strong_message_params)
  end

  private
  def strong_message_params
    params.require(:message).permit(:author, :kind, :content)
  end

end
