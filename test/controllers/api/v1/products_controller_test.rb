require "test_helper"

class Api::V1::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_product = api_v1_products(:one)
  end

  test "should get index" do
    get api_v1_products_url, as: :json
    assert_response :success
  end

  test "should create api_v1_product" do
    assert_difference('Api::V1::Product.count') do
      post api_v1_products_url, params: { api_v1_product: { category_id: @api_v1_product.category_id, item_id: @api_v1_product.item_id, maker_id: @api_v1_product.maker_id, picture: @api_v1_product.picture, subcategory_id: @api_v1_product.subcategory_id } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_product" do
    get api_v1_product_url(@api_v1_product), as: :json
    assert_response :success
  end

  test "should update api_v1_product" do
    patch api_v1_product_url(@api_v1_product), params: { api_v1_product: { category_id: @api_v1_product.category_id, item_id: @api_v1_product.item_id, maker_id: @api_v1_product.maker_id, picture: @api_v1_product.picture, subcategory_id: @api_v1_product.subcategory_id } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_product" do
    assert_difference('Api::V1::Product.count', -1) do
      delete api_v1_product_url(@api_v1_product), as: :json
    end

    assert_response 204
  end
end
