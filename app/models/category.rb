class Category < ApplicationRecord

  #リレーション
  has_many :posts, dependent: :destroy

end
