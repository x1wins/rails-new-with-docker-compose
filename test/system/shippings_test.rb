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
    input_form
    click_on "Create Shipping"
    assert_text "Shipping was successfully created"
    click_on "Back"
  end

  test "updating a Shipping" do
    visit shippings_url
    click_on "Edit", match: :first
    input_form
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

  def input_form
    # Customs
    select Custom.customs_types.key(@custom_attributes[:customs_type]).to_s, from: "Customs type"
    select Custom.recipient_types.key(@custom_attributes[:recipient_type]).to_s, from: "Recipient type"
    sleep 1
    # Order
    fill_in 'Weight', with: @order_attributes[:weight]
    fill_in 'Order number', with: @order_attributes[:order_number]
    fill_in 'Product name', with: @order_attributes[:product_name]
    fill_in 'Count', with: @order_attributes[:count]
    fill_in 'Price', with: @order_attributes[:price]
    fill_in 'Hs code', with: @order_attributes[:hs_code]
    sleep 1
    # Parcel
    fill_in 'Box count', with: @parcel_attributes[:box_count]
    fill_in 'Memo', with: @parcel_attributes[:memo]
    fill_in 'Status', with: @parcel_attributes[:status]
    sleep 1
    # To Address
    fill_in 'shipping_to_address_attributes_owner_name', with: @to_address_attributes[:owner_name]
    fill_in 'shipping_to_address_attributes_ssn', with: @to_address_attributes[:ssn]
    fill_in 'shipping_to_address_attributes_phone1', with: @to_address_attributes[:phone1]
    fill_in 'shipping_to_address_attributes_phone2', with: @to_address_attributes[:phone2]
    fill_in 'shipping_to_address_attributes_address1', with: @to_address_attributes[:address1]
    fill_in 'shipping_to_address_attributes_address2', with: @to_address_attributes[:address2]
    fill_in 'shipping_to_address_attributes_zipcode', with: @to_address_attributes[:zipcode]
    sleep 1
    # From Address
    fill_in 'shipping_from_address_attributes_owner_name', with: @from_address_attributes[:owner_name]
    fill_in 'shipping_from_address_attributes_ssn', with: @from_address_attributes[:ssn]
    fill_in 'shipping_from_address_attributes_phone1', with: @from_address_attributes[:phone1]
    fill_in 'shipping_from_address_attributes_phone2', with: @from_address_attributes[:phone2]
    fill_in 'shipping_from_address_attributes_address1', with: @from_address_attributes[:address1]
    fill_in 'shipping_from_address_attributes_address2', with: @from_address_attributes[:address2]
    fill_in 'shipping_from_address_attributes_zipcode', with: @from_address_attributes[:zipcode]
    sleep 1
  end
end
