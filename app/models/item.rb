class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :image, presence: true
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_info, presence: true, length: { maximum: 1000 }
  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_sales_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
end
