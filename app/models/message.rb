class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
# 各レコードとファイルを1対1の関係で紐づけるメソッドです。
# has_one_attachedメソッドを記述したモデルの各レコードは、それぞれ1つのファイルを添付できます。

  validates :content, presence: true
end
