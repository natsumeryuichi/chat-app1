Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "messages#index"
  resources :users, only: [:edit, :update]
# ユーザー編集に必要なルーティングは、editとupdateなので、routes.rbに、 resources :users, only: [:edit, :update]と追記します。
# 次に、rails g controller usersコマンドで編集機能の実装に必要なUsersコントローラーを作成します。
  resources :rooms, only: [:new, :create]
# 新規チャットルームの作成で動くアクションは「new」と「create」のみなので、上記のようなコードとなります。
end
