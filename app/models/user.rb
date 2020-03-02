class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many   :items
  has_many :cards
  has_one :street_address 
  accepts_nested_attributes_for :street_address,allow_destroy: true
  has_many   :messages

  validates  :nickname,:birth_year,:birth_month,:birth_day,presence: true
   # メールの正規表現
  # validates :email, presence: true, length: { maximum: 255 },uniqueness: true
  # format: { with: /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  # gem 'email_validator', '~> 1.6'   を追加予定２・１６
  validates :first_name_kana,:last_name_kana, presence: true,
  format: { with: /\A([ァ-ン]|ー)+\Z/}
  validates :first_name,:last_name, presence: true,
  format: { with:/\A[ぁ-んァ-ン一-龥]/}
  has_many :orders
end
