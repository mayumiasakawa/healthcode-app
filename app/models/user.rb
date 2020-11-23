class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_NAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/
  
  with_options presence: true, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters.' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: VALID_NAMEKANA_REGEX, message: 'is invalid. Input full-width katakana characters.' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }, confirmation: true
  validates :email, presence: true, uniqueness: true, format: { with:VALID_EMAIL_REGEX, message: 'is invalid. Format is not.' }
  validates :birthday, presence: true
end
