class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string  :content
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
# room_idとuser_idは、roomsテーブルとusersテーブルのidが主キーであり、messagesテーブルと関連性を持つ場合に必要なカラムです。
# そのidで判別できるレコードに関連付けを行う場合に使用するものが、外部キー制約です。
# roomとuserには、foreign_key: trueの制約をつけましょう。こちらの制約をつけることにより、外部キー（今回であればroom_idとuser_id）がないとDBに保存できないようにします。
    end
  end
end
