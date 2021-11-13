class Shipping < ApplicationRecord
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
end
