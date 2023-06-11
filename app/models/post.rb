class Post < ApplicationRecord
  #画像投稿
  has_one_attached :image

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
    favorites.where(user_id: user.id).exists?
  end

    #検索方法の分岐定義
  def self.looks(search, word)
    if search == "perfect"
      @post = Post.where("text LIKE?", "#{word}")
    elsif search == "forward"
      @post = Post.where("text LIKE?", "#{word}%")
    elsif search == "backward"
      @post = Post.where("text LIKE?", "%#{word}")
    elsif search == "partial"
      @post = Post.where("text LIKE?", "%#{word}%")
    else
      @post = Post.all
    end
  end

end
