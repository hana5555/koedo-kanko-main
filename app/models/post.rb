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

end
