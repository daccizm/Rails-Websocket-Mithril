class ChatsController < ApplicationController

  def index
    respond_to do |format|
      format.json do
        @chats = Chat.all
      end
      format.html {}
    end
  end

  def create
    respond_to do |format|
      format.json do
        chat = Chat.new(chat_params)
        chat.save!
        Websocket::Publisher.instance.publish(chat.to_json)
        render json: {}
      end
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end
end
