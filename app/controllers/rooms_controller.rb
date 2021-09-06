class RoomsController < ApplicationController

  def new
    @room = Room.new
  end
 # チャットルームの新規作成なので「new」アクションを定義します。
 # また、form_withに渡す引数として、値が空のRoomインスタンスを@roomに代入しています。

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
      # 成功した場合はredirect_toメソッドでルートパスにリダイレクト
    else
      render :new
      # 失敗した場合はrenderメソッドでrooms/new.html.erbのページを表示
    end
  end
# Railsではセキュリティ対策として、保存する前にストロングパラメーターを使い、許可するパラメーターを指定してから、データを保存するよう推奨されています。
# 今回は、バリューが配列で送られてきているため、配列の保存を許可するためのストロングパラメーターが必要になります。

def destroy
  room = Room.find(params[:id])
  room.destroy
  redirect_to root_path
end

  private
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
  # この中に、user_ids: []という記述があります。このように、配列に対して保存を許可したい場合は、キーに対し[]を値として記述します。
# またcreateアクション内の記述も保存の成功・失敗による条件分岐が必要なので確認しておきましょう。
end
