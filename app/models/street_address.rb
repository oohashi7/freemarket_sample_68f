class StreetAddress < ApplicationRecord
  has_many :items
  has_many :orders
  belongs_to :user,  inverse_of: :street_address, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
  validates :city,:address,:zipcode,  presence: true
end
