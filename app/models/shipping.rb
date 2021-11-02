class Shipping < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :all_search, associated_against: {
      order: [:order_number, :product_name, :price],
      parcel: :memo,
      to_address: [:type, :owner_name, :ssn, :phone1, :phone2, :address1, :address2, :zipcode],
      from_address: [:type, :owner_name, :ssn, :phone1, :phone2, :address1, :address2, :zipcode]
  }
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
  scope :with_all_column_like, lambda { |q|
    if q.present?
      search = q.downcase
      parcel_with_name_like(search).joins(:parcel)
          .or(order_with_name_like(search))
          .or(to_address_with_name_like(search))
          .or(from_address_with_name_like(search))
          .joins(:order)
          .joins("LEFT JOIN addresses a ON shippings.to_address_id = a.id")
          .joins("LEFT JOIN addresses b ON shippings.from_address_id = b.id")
    end
  }
  scope :parcel_with_name_like, lambda { |search|
    where("
              lower(parcels.memo) LIKE :search
              ", search: "%#{search}%")
  }
  scope :order_with_name_like, lambda { |search|
    where("
              lower(orders.product_name) LIKE :search
              ", search: "%#{search}%")
  }
  scope :to_address_with_name_like, lambda { |search|
    where("lower(a.owner_name) LIKE :search
                              OR lower(a.ssn) LIKE :search
                              OR lower(a.phone1) LIKE :search
                              OR lower(a.phone2) LIKE :search
                              OR lower(a.address1) LIKE :search
                              OR lower(a.address2) LIKE :search
                              OR lower(a.zipcode) LIKE :search", search: "%#{search}%")
  }
  scope :from_address_with_name_like, lambda { |search|
    where("lower(b.owner_name) LIKE :search
                                OR lower(b.ssn) LIKE :search
                                OR lower(b.phone1) LIKE :search
                                OR lower(b.phone2) LIKE :search
                                OR lower(b.address1) LIKE :search
                                OR lower(b.address2) LIKE :search
                                OR lower(b.zipcode) LIKE :search", search: "%#{search}%")
  }
end
