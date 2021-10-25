class Address < ApplicationRecord
  validates :owner_name, presence: true
  validates :ssn, presence: true
  validates :phone1, presence: true
  validates :phone2, presence: true
  validates :address1, presence: true
  validates :address2, presence: true
  validates :zipcode, presence: true
end
