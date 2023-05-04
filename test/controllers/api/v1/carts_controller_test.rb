require "test_helper"

class Api::V1::CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_cart = api_v1_carts(:one)
  end

  test "should get index" do
    get api_v1_carts_url, as: :json
    assert_response :success
  end

  test "should create api_v1_cart" do
    assert_difference('Api::V1::Cart.count') do
      post api_v1_carts_url, params: { api_v1_cart: { criteria: @api_v1_cart.criteria, discarded_at: @api_v1_cart.discarded_at, group_id: @api_v1_cart.group_id, item_id: @api_v1_cart.item_id, price: @api_v1_cart.price } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_cart" do
    get api_v1_cart_url(@api_v1_cart), as: :json
    assert_response :success
  end

  test "should update api_v1_cart" do
    patch api_v1_cart_url(@api_v1_cart), params: { api_v1_cart: { criteria: @api_v1_cart.criteria, discarded_at: @api_v1_cart.discarded_at, group_id: @api_v1_cart.group_id, item_id: @api_v1_cart.item_id, price: @api_v1_cart.price } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_cart" do
    assert_difference('Api::V1::Cart.count', -1) do
      delete api_v1_cart_url(@api_v1_cart), as: :json
    end

    assert_response 204
  end
end
