require "application_system_test_case"

class ShippingsTest < ApplicationSystemTestCase
  setup do
    @shipping = FactoryBot.create :shipping
    @custom_attributes = FactoryBot.attributes_for :custom
    @order_attributes = FactoryBot.attributes_for :order
    @parcel_attributes = FactoryBot.attributes_for :parcel
    @to_address_attributes = FactoryBot.attributes_for :to_address
    @from_address_attributes = FactoryBot.attributes_for :from_address
    @shipping_attributes = FactoryBot.attributes_for :shipping,
                                                     custom_attributes: @custom_attributes,
                                                     order_attributes: @order_attributes,
                                                     parcel_attributes: @parcel_attributes,
                                                     to_address_attributes: @to_address_attributes,
                                                     from_address_attributes: @from_address_attributes
  end

  test "visiting the index" do
    visit shippings_url
    assert_selector "h6", text: "Shipping list"
  end

  test "creating a Shipping" do
    visit shippings_url
    click_on "New Shipping"

    click_on "Create Shipping"

    assert_text "Shipping was successfully created"
    click_on "Back"
  end

  test "updating a Shipping" do
    visit shippings_url
    click_on "Edit", match: :first

    click_on "Update Shipping"

    assert_text "Shipping was successfully updated"
    click_on "Back"
  end

  test "destroying a Shipping" do
    visit shippings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shipping was successfully destroyed"
  end
end
