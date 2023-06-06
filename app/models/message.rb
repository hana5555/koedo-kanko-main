class Message < ApplicationRecord
  has_one_attached :image

  #リレーション
  belongs_to :admin

end
