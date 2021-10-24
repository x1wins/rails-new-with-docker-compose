class Shipping < ApplicationRecord
  has_one :parcel
  has_one :order
  has_one :custom
  belongs_to :to_address
  belongs_to :from_address
  accepts_nested_attributes_for :parcel, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :to_address, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :from_address, allow_destroy: true, update_only: true
end
