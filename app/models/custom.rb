class Custom < ApplicationRecord
  enum customs_types: { 목록통관: 1, 일반통관: 2 }
  enum recipient_types: { 개인: 1, 법인: 2 }
  belongs_to :shipping
  validates :customs_type, numericality: { only_integer: true }
  validates :recipient_type, numericality: { only_integer: true }
end
