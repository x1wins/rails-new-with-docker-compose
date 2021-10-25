class FromAddress < Address
  has_one :shipping, foreign_key: 'from_address_id'
end
