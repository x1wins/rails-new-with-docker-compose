class Custom < ApplicationRecord
  belongs_to :shipping
  validates :customs_type, numericality: { only_integer: true }
  validates :recipient_type, numericality: { only_integer: true }
end
