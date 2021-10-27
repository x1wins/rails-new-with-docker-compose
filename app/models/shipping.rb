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
  scope :with_all_column_like, lambda { |search|
    parcel_with_name_like(search).joins(:parcel)
        .or(order_with_name_like(search))
        .or(to_address_with_name_like(search))
        .or(from_address_with_name_like(search))
        .joins(:order)
        .joins(:to_address)
        .joins(:from_address) if search.present?
  }
  scope :parcel_with_name_like, lambda { |search|
    where("
              parcels.memo LIKE :search
              ", search: "%#{search}%")
  }
  scope :order_with_name_like, lambda { |search|
    where("
              orders.product_name LIKE :search
              ", search: "%#{search}%")
  }
  scope :to_address_with_name_like, lambda { |search|
    where("addresses.owner_name LIKE :search
                              OR addresses.ssn LIKE :search
                              OR addresses.phone1 LIKE :search
                              OR addresses.phone2 LIKE :search
                              OR addresses.address1 LIKE :search
                              OR addresses.address2 LIKE :search
                              OR addresses.zipcode LIKE :search", search: "%#{search}%")
  }
  scope :from_address_with_name_like, lambda { |search|
    where("from_addresses_shippings.owner_name LIKE :search
                                OR from_addresses_shippings.ssn LIKE :search
                                OR from_addresses_shippings.phone1 LIKE :search
                                OR from_addresses_shippings.phone2 LIKE :search
                                OR from_addresses_shippings.address1 LIKE :search
                                OR from_addresses_shippings.address2 LIKE :search
                                OR from_addresses_shippings.zipcode LIKE :search", search: "%#{search}%")
  }
end
