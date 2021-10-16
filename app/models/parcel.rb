class Parcel < ApplicationRecord
  belongs_to :shipping
  validates :box_count, numericality: { only_integer: true }
  validates :memo, presence: true
  validates :status, numericality: { only_integer: true }
end
