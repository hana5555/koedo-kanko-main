class Post < ApplicationRecord
  #画像投稿
  has_one_attached :image

  #バリデーション
  validates :image, presence: true
  validates :text, presence: true
  validates :status, presence: true

  #リレーション
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :searches, dependent: :destroy

  belongs_to :user
  belongs_to :category

  #下書きステータス(published=投稿する、draft=下書き)
  enum status: { published: 0, draft: 1 }
  #validates :status, inclusion: { in: Article.statuses.keys }

  #公開・非公開機能
  scope :display, -> {where(is_displayed: true)}
  scope :undisplay, -> {where(is_displayed: false)}

  #いいね機能用
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

    #検索方法の分岐定義
 def self.search(search)
   if search
     where(['text LIKE ?', "%#{search}%"]) #検索とtext(投稿キャプション)の部分一致を表示
   else
     "見つかりませんでした。" #検索内容がなかった場合
   end
 end

end
