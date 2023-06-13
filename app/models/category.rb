class Category < ApplicationRecord

  #バリデーション
  validates :name, presence: true

  #リレーション
  has_many :posts, dependent: :destroy

end
