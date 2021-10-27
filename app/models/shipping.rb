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
        .joins("LEFT JOIN addresses a ON shippings.to_address_id = a.id")
        .joins("LEFT JOIN addresses b ON shippings.from_address_id = b.id") if search.present?
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
    where("a.owner_name LIKE :search
                              OR a.ssn LIKE :search
                              OR a.phone1 LIKE :search
                              OR a.phone2 LIKE :search
                              OR a.address1 LIKE :search
                              OR a.address2 LIKE :search
                              OR a.zipcode LIKE :search", search: "%#{search}%")
  }
  scope :from_address_with_name_like, lambda { |search|
    where("b.owner_name LIKE :search
                                OR b.ssn LIKE :search
                                OR b.phone1 LIKE :search
                                OR b.phone2 LIKE :search
                                OR b.address1 LIKE :search
                                OR b.address2 LIKE :search
                                OR b.zipcode LIKE :search", search: "%#{search}%")
  }
end
