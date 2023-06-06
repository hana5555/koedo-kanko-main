class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true #ユーザーID
      t.references :category, null: false, foreign_key: true #カテゴリーID
      t.text :text,null: false #投稿テキスト
      t.integer :status,null: false,default: 0 #投稿下書き enumで管理
      t.boolean :is_displayed,null: false, default: true #true 公開 false 非公開
      t.timestamps
    end
  end
end
