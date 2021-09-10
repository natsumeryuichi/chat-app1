FactoryBot.define do
  factory :room_user do
    association :user
    association :room
# これで、中間テーブルのテスト用モデルにアソシエーションが定義できました。
  end
end