class Shipping < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:order_product_name, :parcel_memo,
      :to_address_ssn, :to_address_phone1, :to_address_phone2, :to_address_address1, :to_address_address2, :to_address_zipcode,
      :from_address_ssn, :from_address_phone1, :from_address_phone2, :from_address_address1, :from_address_address2, :from_address_zipcode]
  def order_product_name
    order.product_name
  end
  def parcel_memo
    parcel.memo
  end

  def to_address_owner_name
    to_address.owner_name
  end
  def to_address_ssn
    to_address.ssn
  end
  def to_address_phone1
    to_address.phone1
  end
  def to_address_phone2
    to_address.phone2
  end
  def to_address_address1
    to_address.address1
  end
  def to_address_address2
    to_address.address2
  end
  def to_address_zipcode
    to_address.zipcode
  end
  def from_address_owner_name
    from_address.owner_name
  end
  def from_address_ssn
    from_address.ssn
  end
  def from_address_phone1
    from_address.phone1
  end
  def from_address_phone2
    from_address.phone2
  end
  def from_address_address1
    from_address.address1
  end
  def from_address_address2
    from_address.address2
  end
  def from_address_zipcode
    from_address.zipcode
  end
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
  scope :full_text_search_for, -> (term) do
    joins(:pg_search_document).merge(
        PgSearch.multisearch(term).where(searchable_type: klass.to_s)
    )
  end
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
