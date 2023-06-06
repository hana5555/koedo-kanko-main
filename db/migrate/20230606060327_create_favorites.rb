class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true #ユーザーID
      t.references :post, null: false, foreign_key: true #投稿ID
      t.timestamps
    end
  end
end
