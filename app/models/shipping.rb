class Shipping < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:order_product_name, :parcel_memo,
      :to_address_ssn, :to_address_phone1, :to_address_phone2, :to_address_address1, :to_address_address2, :to_address_zipcode,
      :from_address_ssn, :from_address_phone1, :from_address_phone2, :from_address_address1, :from_address_address2, :from_address_zipcode]
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
    PgSearch.multisearch(term).where(searchable_type: name).pluck(:searchable_id)
  end
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
end
