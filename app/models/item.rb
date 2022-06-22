class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_sales_status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_shipping_fee_status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_scheduled_delivery

  validates :image, presence: true
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_info, presence: true, length: { maximum: 1000 }
  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :item_sales_status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_price, presence: true, numericality: { in: 300..9_999_999 },format: { with: /\A[0-9]+\z/ }
 
end
