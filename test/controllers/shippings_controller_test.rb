require "test_helper"

class ShippingsControllerTest < ActionDispatch::IntegrationTest
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

  test "should show autocomplete" do
    get autocomplete_shippings_url, params: {q: 'call'}
    assert_response :success
  end

  test "should create shipping" do
    assert_difference('Shipping.count') do
      post shippings_url, params: { shipping: @shipping_attributes }
    end

    assert_redirected_to shipping_url(Shipping.last)
  end

  test "should show shipping" do
    get shipping_url(@shipping)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipping_url(@shipping)
    assert_response :success
  end

  test "should update shipping" do
    patch shipping_url(@shipping), params: { shipping: @shipping_attributes }
    assert_redirected_to shipping_url(@shipping)
  end

  test "should destroy shipping" do
    assert_difference('Shipping.count', -1) do
      delete shipping_url(@shipping)
    end

    assert_redirected_to shippings_url
  end
end
