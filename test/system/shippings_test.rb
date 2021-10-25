require "application_system_test_case"

class ShippingsTest < ApplicationSystemTestCase
  setup do
    @shipping = shippings(:one)
  end

  test "visiting the index" do
    visit shippings_url
    assert_selector "h1", text: "Shippings"
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
