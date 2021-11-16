require "application_system_test_case"

class StoresTest < ApplicationSystemTestCase
  setup do
    @store = FactoryBot.create :store
    @store_attributes = FactoryBot.attributes_for :store
  end

  test "visiting the index" do
    visit stores_url
    assert_selector "h1", text: "Stores"
  end

  test "creating a Store" do
    visit stores_url
    click_on "New Store"

    check "Lockable" if @store.lockable
    fill_in "Logo", with: @store.logo
    fill_in "Name", with: @store.name
    click_on "Create Store"

    assert_text "Store was successfully created"
    click_on "Back"
  end

  test "updating a Store" do
    visit stores_url
    click_on "Edit", match: :first

    check "Lockable" if @store.lockable
    fill_in "Logo", with: @store.logo
    fill_in "Name", with: @store.name
    click_on "Update Store"

    assert_text "Store was successfully updated"
    click_on "Back"
  end

  test "destroying a Store" do
    visit stores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Store was successfully destroyed"
  end
end
