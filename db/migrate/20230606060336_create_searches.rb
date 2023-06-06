class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.references :post, null: false, foreign_key: true #投稿ID
      t.timestamps
    end
  end
end
