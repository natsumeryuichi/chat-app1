class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
# usersテーブルとroomsテーブルのアソシエーションを記述

  validates :name, presence: true
  # チャットルームを新規作成するにあたって「ルーム名」は必ず必要なので、
  # 上記のバリデーションは「ルーム名が存在（presence）している場合のみ作成可（true）」という意味です。

end
