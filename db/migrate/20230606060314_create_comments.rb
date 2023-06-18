class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true, type: :bigint #ユーザーID
      t.references :post, null: false, foreign_key: true, type: :bigint #投稿ID
      t.string :comment, null: false #コメント
      t.boolean :is_displayed, null: false, default: true #true 公開 false 非公開
      t.timestamps
    end
  end
end
