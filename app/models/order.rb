class Order < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:product_name, :order_number]
  pg_search_scope :search_by_product_name, against: [:product_name, :order_number]

  belongs_to :shipping
  validates :weight, numericality: { only_float: true }
  validates :order_number, presence: true
  validates :product_name, presence: true
  validates :count, numericality: { only_integer: true }
  validates :price, numericality: { only_integer: true }
  validates :hs_code, numericality: { only_integer: true }
end
