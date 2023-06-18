class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.bigint :user_id, null: false #ユーザーID
      t.bigint :post_id, null: false #投稿ID
      t.string :comment, null: false #コメント
      t.boolean :is_displayed, null: false, default: true #true 公開 false 非公開
      t.timestamps
    end

    add_foreign_key :comments, :users
    add_foreign_key :comments, :posts
  end
end
