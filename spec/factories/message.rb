FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
# 画像は生成したインスタンスに紐付ける必要があります。そのため、afterというメソッドを用いて、インスタンス生成後に画像が保存されるようにしましょう。
# ＜afterアフターメソッド＞
# afterメソッドは任意の処理の後に指定の処理を実行することができます。例えば、after(:build) とすることで、インスタンスがbuildされた後に指定の処理を実行できます。
  end
end
