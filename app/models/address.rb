class Address < ApplicationRecord
  validates :address1, presence: true
  validates :address2, presence: true
end
