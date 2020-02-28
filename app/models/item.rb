class Item < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :user
  belongs_to :category
  belongs_to :size
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :condition
    belongs_to_active_hash :deriver_charge
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :deriver_date
    belongs_to_active_hash :soldout_or_exhibiting
  # has_many :likes
  # has_many :message_users,through::messages,source::user
  # has_many :like_users,through::likes,source::user
  # belongs_to :profit
  # belongs_to :prefecture
  # belongs_to :brand
  # belongs_to :condition
  # belongs_to :delivery_charge
  # belongs_to :delivery_date
  # belongs_to :order_status

  validates :name,:price,:description,:deriver_charge,:deriver_date,:category_id,:condition_id,:prefecture_id, presence: true

  def previous
    user.items.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    user.items.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end

end
