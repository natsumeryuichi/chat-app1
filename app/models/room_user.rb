class RoomUser < ApplicationRecord
  belongs_to :room
  belongs_to :user
# usersテーブルとroomsテーブルのアソシエーション
end
