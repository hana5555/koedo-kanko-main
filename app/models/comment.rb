class Comment < ApplicationRecord

  #リレーション
  belongs_to :user
  belongs_to :post

end
