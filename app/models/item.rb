class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_sales_status

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_shipping_fee

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_prefecture

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_scheduled_delivery

end
