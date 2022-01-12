class Shipping < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:order_product_name, :parcel_memo, :to_address_owner_name, :from_address_owner_name]
  has_one :custom, dependent: :destroy
  has_one :order, dependent: :destroy
  has_one :parcel, dependent: :destroy
  belongs_to :to_address, dependent: :destroy
  belongs_to :from_address, dependent: :destroy
  accepts_nested_attributes_for :custom, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :order, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :parcel, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :to_address, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :from_address, allow_destroy: true, update_only: true

  def order_product_name
    order.product_name
  end
  def parcel_memo
    parcel.memo
  end
  def to_address_owner_name
    to_address.owner_name
  end
  def from_address_owner_name
    from_address.owner_name
  end
end
