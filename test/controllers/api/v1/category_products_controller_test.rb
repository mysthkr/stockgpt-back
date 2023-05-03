require "test_helper"

class Api::V1::CategoryProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_category_product = api_v1_category_products(:one)
  end

  test "should get index" do
    get api_v1_category_products_url, as: :json
    assert_response :success
  end

  test "should create api_v1_category_product" do
    assert_difference('Api::V1::CategoryProduct.count') do
      post api_v1_category_products_url, params: { api_v1_category_product: { name: @api_v1_category_product.name } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_category_product" do
    get api_v1_category_product_url(@api_v1_category_product), as: :json
    assert_response :success
  end

  test "should update api_v1_category_product" do
    patch api_v1_category_product_url(@api_v1_category_product), params: { api_v1_category_product: { name: @api_v1_category_product.name } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_category_product" do
    assert_difference('Api::V1::CategoryProduct.count', -1) do
      delete api_v1_category_product_url(@api_v1_category_product), as: :json
    end

    assert_response 204
  end
end
