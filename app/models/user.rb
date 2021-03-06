class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  # Userモデルに、validates :name, presence: trueを追記します。
  # 「name」カラムに、presence: trueを設けることで、空の場合はDBに保存しないというバリデーションを設定しています。
  # つまり、ユーザー登録時に「name」を空欄にして登録しようとすると、エラーが発生します。
  has_many :room_users
  has_many :rooms, through: :room_users
# usersテーブルとroomsテーブルのアソシエーションを記述
  has_many :messages
end
