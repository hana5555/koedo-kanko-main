class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #バリデーション
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :username, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/ }


  #リレーション
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #ゲストログイン
  def self.guest
    find_or_create_by!(last_name: 'ゲスト', first_name: 'ユーザー', last_name_kana: 'ゲスト', first_name_kana: 'ユーザー', username: 'guestuser', email: 'guest@example.com', telephone_number: '00000000000') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  #フルネームで表示させる
  def full_name
    self.last_name + " " + self.first_name
  end

end
