class Shipping < ApplicationRecord
  has_one :custom
  has_one :order
  has_one :parcel
  belongs_to :to_address
  belongs_to :from_address
  accepts_nested_attributes_for :custom, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :order, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :parcel, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :to_address, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :from_address, allow_destroy: true, update_only: true
  scope :with_name_like, lambda { |search|
    joins(:to_address).where("addresses.owner_name LIKE :search
OR addresses.ssn LIKE :search
OR addresses.phone1 LIKE :search
OR addresses.phone2 LIKE :search
OR addresses.address1 LIKE :search
OR addresses.address2 LIKE :search
OR addresses.zipcode LIKE :search", search: "%#{search}%") if search.present?
  }
end
