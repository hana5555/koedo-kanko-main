class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.bigint :user_id, null: false #ユーザーID
      t.bigint :category_id, null: false #カテゴリーID
      t.text :text,null: false #投稿テキスト
      t.integer :status,null: false,default: 0 #投稿下書き enumで管理
      t.boolean :is_displayed,null: false, default: true #管理者側機能 true 公開 false 非公開
      t.timestamps
    end

    add_foreign_key :posts, :users
    add_foreign_key :posts, :categories
  end
end
