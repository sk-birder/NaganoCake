class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 要件定義書に記述はないがnull: falseしたもの
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

  # 以下要件定義書に記述なし
  # validates :email, uniqueness: true
  # validates :postal_code, length: { is: 7 }
  # validates :telephone_number, length: { minimum: 10, maximum: 11 }
  
end
