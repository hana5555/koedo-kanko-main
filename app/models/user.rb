class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
  
  #検索方法の分岐定義
  def self.looks(search, word)
    if search == "perfect"
      @user = User.where("username LIKE?", "#{word}")
    elsif search == "forward"
      @user = User.where("username LIKE?", "#{word}%")
    elsif search == "backward"
      @user = User.where("username LIKE?", "%#{word}")
    elsif search == "partial"
      @user = User.where("username LIKE?", "%#{word}%")
    else
      @user = User.all
    end
  end
      
end
