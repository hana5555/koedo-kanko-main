class Message < ApplicationRecord
  has_one_attached :image

  #バリデーション
  validates :message, presence: true
  validates :image, presence: true


end
