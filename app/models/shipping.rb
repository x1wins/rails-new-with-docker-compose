class Shipping < ApplicationRecord
  has_one :parcel
  accepts_nested_attributes_for :parcel, allow_destroy: true, update_only: true
end
