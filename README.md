# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

shipping = FactoryBot.create :shipping
word = shipping.parcel.memo
searched_list = PgSearch.multisearch(word)
searched_list.first
id = searched_list.first.searchable_id
sarched_memo = Shipping.find_by_id(id).parcel.memo
sarched_memo == word
searched_list.size


shipping = FactoryBot.create :shipping
word = shipping.parcel.memo
word = word.split.first
searched_list = PgSearch.multisearch(word)
searched_list.first
id = searched_list.first.searchable_id
sarched_memo = Shipping.find_by_id(id).parcel.memo
sarched_memo == word
searched_list.size


ActiveRecord::Base.connection.execute("EXPLAIN ANALYZE #{PgSearch.multisearch('Diablo').to_sql}").values

PgSearch::Multisearch.rebuild(Shipping)