class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :title,null: false #町からのお知らせタイトル(TOPページ新着表示用)
      t.text :message,null: false #町からのお知らせ
      t.timestamps
    end
  end
end
