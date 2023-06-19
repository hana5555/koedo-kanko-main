class Favorite < ApplicationRecord

  #リレーション
  belongs_to :user
  belongs_to :post

  #ユーザーが１投稿に対して１いいねしかつけられない
  validates_uniqueness_of :post_id, scope: :user_id

end
