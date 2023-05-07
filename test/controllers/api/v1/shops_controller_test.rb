require "test_helper"

class Api::V1::ShopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_shop = api_v1_shops(:one)
  end

  test "should get index" do
    get api_v1_shops_url, as: :json
    assert_response :success
  end

  test "should create api_v1_shop" do
    assert_difference('Api::V1::Shop.count') do
      post api_v1_shops_url, params: { api_v1_shop: { name: @api_v1_shop.name, prefecture: @api_v1_shop.prefecture } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_shop" do
    get api_v1_shop_url(@api_v1_shop), as: :json
    assert_response :success
  end

  test "should update api_v1_shop" do
    patch api_v1_shop_url(@api_v1_shop), params: { api_v1_shop: { name: @api_v1_shop.name, prefecture: @api_v1_shop.prefecture } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_shop" do
    assert_difference('Api::V1::Shop.count', -1) do
      delete api_v1_shop_url(@api_v1_shop), as: :json
    end

    assert_response 204
  end
end
