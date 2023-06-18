class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.bigint :post_id, null: false #投稿ID
      t.timestamps
    end

    add_foreign_key :searches, :posts
  end
end
