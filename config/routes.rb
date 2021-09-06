Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
# ユーザー編集に必要なルーティングは、editとupdateなので、routes.rbに、 resources :users, only: [:edit, :update]と追記します。
# 次に、rails g controller usersコマンドで編集機能の実装に必要なUsersコントローラーを作成します。
  resources :rooms, only: [:new, :create, :destroy] do
# 新規チャットルームの作成で動くアクションは「new」と「create」のみなので、上記のようなコードとなります。
    resources :messages, only: [:index, :create]
# 今回の場合、ネストをすることにより、roomsが親で、messagesが子という親子関係になるので、チャットルームに属しているメッセージという意味になります。
# これによって、メッセージに結びつくルームのidの情報を含んだパスを、受け取れるようになります。
  end
end
