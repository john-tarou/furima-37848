class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, presence: true
  validates :birth_date, presence: true

  with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'に全角（漢字・ひらがな・カタカナ）を使用してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'に全角カタカナを使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は6文字以上かつ英数字をそれぞれ含めてください' }
end
