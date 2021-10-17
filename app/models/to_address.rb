class ToAddress < Address
  has_one :shipping, foreign_key: 'to_address_id'
end
