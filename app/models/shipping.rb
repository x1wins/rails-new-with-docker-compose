class Shipping < ApplicationRecord
  has_one :parcel
  has_one :to_address, class_name: "Address", optional: true, foreign_key: shipping_id
  has_one :from_address, class_name: "Address", optional: true, foreign_key: shipping_id
  accepts_nested_attributes_for :parcel, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :to_address, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :from_address, allow_destroy: true, update_only: true
end
