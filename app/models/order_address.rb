class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :item_prefecture_id, :city, :addresses, :building, :phone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :addresses
    validates :phone_number, numericality: { only_integer: true}, length: { minimum: 10, maximum: 11 }
  end
  validates :item_prefecture_id, numericality: {other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, item_prefecture_id: item_prefecture_id, city: city, addresseses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end