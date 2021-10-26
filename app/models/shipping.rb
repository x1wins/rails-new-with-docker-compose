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
  scope :search, lambda{ |search| self.where("to_address.title LIKE :search or body LIKE :search",  search: "%#{search}%") if search.present? }
  scope :with_name_like, lambda { |search|
    includes(:to_address).where("address.owner_name LIKE :search
OR to_address.ssn LIKE :search
OR to_address.phone1 LIKE :search
OR to_address.phone2 LIKE :search
OR to_address.address1 LIKE :search
OR to_address.address2 LIKE :search
OR to_address.zipcode LIKE :search", search: "%#{search}%") if search.present?
  }
end
