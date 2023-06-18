class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.bigint :user_id, null: false #ユーザーID
      t.bigint :post_id, null: false #投稿ID
      t.timestamps
    end

    add_foreign_key :favorites, :users
    add_foreign_key :favorites, :posts
  end
end
