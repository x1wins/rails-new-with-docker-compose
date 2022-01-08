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
ActiveRecord::Base.connection.execute("EXPLAIN ANALYZE #{Shipping.full_text_search_for(term).to_sql}").values
ActiveRecord::Base.connection.execute("EXPLAIN ANALYZE #{PgSearch.multisearch('diablo').to_sql}").values
Shipping.full_text_search_for(term)
PgSearch.multisearch(term)

PgSearch::Multisearch.rebuild(Shipping)
PgSearch::Multisearch.rebuild(Shipping, clean_up: true)

irb(main):012:0> ActiveRecord::Base.connection.indexes('pg_search_documents').map(&:name)
=> ["index_pg_search_documents_on_searchable"]
irb(main):013:0> ActiveRecord::Base.connection.indexes('pg_search_documents')
=> 
[#<ActiveRecord::ConnectionAdapters::IndexDefinition:0x00005635d4eee700
  @columns=["searchable_type", "searchable_id"],
  @comment=nil,
  @lengths={},
  @name="index_pg_search_documents_on_searchable",
  @opclasses={},
  @orders={},
  @table="pg_search_documents",
  @type=nil,
  @unique=false,
  @using=:btree,
  @where=nil>]



https://github.com/Casecommons/pg_search/wiki/Building-indexes#how-to-create-a-model-scope-and-use-multisearch-index
% docker-compose run --no-deps web rails generate migration add_index_to_documents_content
class AddIndexToDocumentsContent < ActiveRecord::Migration[6.1]
  def change
    add_index :pg_search_documents, %[to_tsvector('simple', coalesce("pg_search_documents"."content"::text, ''))], using: :gin, name: "index_pg_search_documents_on_content"
  end
end
% docker-compose run --no-deps web rails db:migrate
% docker-compose run --no-deps web rails console
> ActiveRecord::Base.connection.indexes(:pg_search_documents)
>=> 
 [#<ActiveRecord::ConnectionAdapters::IndexDefinition:0x000056053f9e1c00
   @columns="to_tsvector('simple'::regconfig, COALESCE(content, ''::text))",
   @comment=nil,
   @lengths={},
   @name="index_pg_search_documents_on_content",
   @opclasses={},
   @orders={},
   @table=:pg_search_documents,
   @type=nil,
   @unique=false,
   @using=:gin,
   @where=nil>,
  #<ActiveRecord::ConnectionAdapters::IndexDefinition:0x000056053f9e12a0
   @columns=["searchable_type", "searchable_id"],
   @comment=nil,
   @lengths={},
   @name="index_pg_search_documents_on_searchable",
   @opclasses={},
   @orders={},
   @table=:pg_search_documents,
   @type=nil,
   @unique=false,
   @using=:btree,
   @where=nil>]  
   
   