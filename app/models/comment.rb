class Comment < ApplicationRecord

  #リレーション
  belongs_to :user
  belongs_to :post

  validates :comment, presence: true

  #公開・非公開機能
  scope :display, -> {where(is_displayed: true)}
  scope :undisplay, -> {where(is_displayed: false)}

end
