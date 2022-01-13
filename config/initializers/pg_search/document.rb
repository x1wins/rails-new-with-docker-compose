module PgSearch
  class Document < ActiveRecord::Base
    pg_search_scope :multisearch, { against: :content, using: { tsearch: { prefix: true } } }
  end
end