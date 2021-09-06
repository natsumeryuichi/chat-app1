class MessagesController < ApplicationController
  def index
    @message = Message.new
#  @messageには、Message.newで生成した、Messageモデルのインスタンス情報を代入します。
    @room = Room.find(params[:room_id])
# @roomには、Room.find(params[:room_id])と記述することで、paramsに含まれているroom_idを代入します。
# 紐解いて説明すると、直前の問題にあった通りルーティングをネストしているため/rooms/:room_id/messagesといったパスになります。
# パスにroom_idが含まれているため、paramsというハッシュオブジェクトの中に、room_idという値が存在しています。
# そのため、params[:room_id]と記述することでroom_idを取得できます。
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index
    end
# messagesコントローラーにcreateアクションを定義します。
# @room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成し、message_paramsを引数にして、privateメソッドを呼び出します。
# 生成したインスタンスを@messageに代入し、saveメソッドでメッセージの内容をmessagesテーブルに保存します。
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
# privateメソッドとしてmessage_paramsを定義し、メッセージの内容contentをmessagesテーブルへ保存できるようにします。
# パラメーターの中に、ログインしているユーザーのidと紐付いている、メッセージの内容contentを受け取れるように許可します。
  end
end
