class Message < ApplicationRecord
  has_one_attached :image

  #バリデーション
  validates :image, presence: true
  validates :title, presence: true
  validates :message, presence: true


end
