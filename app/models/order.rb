class Order < ApplicationRecord
  belongs_to :shipping
  validates :weight, numericality: { only_float: true }
  validates :order_number, presence: true
  validates :product_name, presence: true
  validates :count, numericality: { only_integer: true }
  validates :price, numericality: { only_integer: true }
  validates :hs_code, numericality: { only_integer: true }
end
